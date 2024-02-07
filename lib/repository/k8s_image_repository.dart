import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/utils/token_manager.dart';

class K8sImageRepository implements ImageRepository {
  final Dio apiHttpClient;
  final Dio s3HttpClient;
  K8sImageRepository({
    required this.apiHttpClient,
    required this.s3HttpClient,
  });

  @override
  Future<List<AppImageMetadata>?> getImageMetadataList({
    required int limit,
    int? afterThisImageId,
  }) async {
    apiHttpClient.options.headers['Content-Type'] = 'application/json';
    final tokenManager = TokenManager();
    final idToken = tokenManager.getDecodedToken(TokenType.id);
    final String userId = idToken['cognito:username'];
    final response = await apiHttpClient.get(
      "/users/$userId/pictures",
      queryParameters: {
        "limit": limit,
        if (afterThisImageId != null) "last": afterThisImageId,
      },
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    if (response.data["pictures"] == null) {
      return [];
    } else {
      return (response.data["pictures"] as List)
          .map((e) => AppImageMetadata.fromJson(e))
          .toList()
        ..sort((a, b) => b.pictureId.compareTo(a.pictureId));
    }
  }

  @override
  Future<List<AppImageData>?> getThumbnailImageDataList({
    required List<AppImageMetadata> imageMetadataList,
  }) async {
    final responses = await Future.wait(
      imageMetadataList.map((imageMetadata) {
        return s3HttpClient
            .get("/original/${imageMetadata.imageUrl}")
            .then((response) => response)
            .catchError((error) {
          // 오류 로깅 또는 기본 데이터 처리
          return null; // 실패한 경우 null 반환 또는 기본 값 설정
        });
      }).toList(),
      eagerError: false, // 하나의 Future가 실패해도 다른 Future의 결과를 기다립니다.
    );

    return responses
        .map(
          (response) => AppImageData(
            selected: false,
            thumbnail: response.statusCode == 200 ? response.data : null,
            original: null,
          ),
        )
        .toList();
  }

  @override
  Future<List<Uint8List?>> getOriginalImageByteList({
    required List<AppImageItem> originalImageDataList,
  }) async {
    apiHttpClient.options.headers['Content-Type'] = 'application/json';

    final responses = await Future.wait(
      originalImageDataList.map((imageItem) {
        return s3HttpClient.get(
          "/original/${imageItem.imageMetadata.imageUrl}",
        );
      }).toList(),
    );

    return responses
        .map((res) => res.statusCode == 200 ? res.data : null)
        .toList() as List<Uint8List?>;
  }

  @override
  Future<List<AppImageMetadata>?> uploadFiles({
    required List<PlatformFile> imageDataList,
  }) async {
    apiHttpClient.options.headers['Content-Type'] = 'multipart/form-data';
    final tokenManager = TokenManager();
    print("userid: ${tokenManager.userId}"); // userId 변수 사용
    final String jsonData =
        jsonEncode({"user_id": tokenManager.userId}); // userId 변수 사용

    final formData = FormData.fromMap({
      "json_data": jsonData,
    });

    formData.files.addAll(
      imageDataList.map(
        (imageData) {
          return MapEntry(
            "images",
            MultipartFile.fromBytes(
              imageData.bytes!,
              filename: imageData.name,
            ),
          );
        },
      ).toList(),
    );

    final response = await apiHttpClient.post(
      '/pictures',
      data: formData,
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    return (response.data["pictures"] as List)
        .map((e) => AppImageMetadata.fromJson(e))
        .toList()
      ..sort((a, b) => b.pictureId.compareTo(a.pictureId));
  }

  @override
  Future<void> deleteImages({
    required List<AppImageMetadata> imageMetadataList,
  }) async {
    final pictureIds =
        imageMetadataList.map((e) => {"picture_id": e.pictureId}).toList();
    final response = await apiHttpClient.delete(
      '/pictures',
      data: jsonEncode({
        "json_data": pictureIds,
      }),
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<bool> toggleFavorite({
    required AppImageMetadata imageMetadata,
  }) async {
    throw UnimplementedError();
  }
}
