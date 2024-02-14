import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/utils/token_manager.dart';

class K8sImageRepository implements ImageRepository {
  final Dio apiHttpClient;
  final Dio s3HttpClient;
  final TokenManager tokenManager;
  K8sImageRepository({
    required this.apiHttpClient,
    required this.s3HttpClient,
    required this.tokenManager,
  });

  @override
  Future<List<AppImageMetadata>?> getImageMetadataList({
    required int limit,
    int? cursor,
    bool? bookmark,
  }) async {
    apiHttpClient.options.headers['Content-Type'] = 'application/json';
    final tokenManager = TokenManager();
    final idToken = tokenManager.getDecodedToken(TokenType.id);
    final String userId = idToken['cognito:username'];
    final response = await apiHttpClient.get(
      "/users/$userId/pictures",
      queryParameters: {
        "limit": limit,
        "bookmark": bookmark == true ? 1 : 0,
        if (cursor != null) "last": cursor,
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
    required List<String> imageUrls,
  }) async {
    final responses = await Future.wait(
      imageUrls.map((imageUrl) {
        return s3HttpClient
            .get("/thumbnail/${tokenManager.userId}/$imageUrl")
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
  Future<Uint8List?> getOriginalImageBytes({
    required String imageUrl,
  }) async {
    apiHttpClient.options.headers['Content-Type'] = 'application/json';

    final response = await s3HttpClient.get(
      "/original/${tokenManager.userId}/$imageUrl",
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    return response.data;
  }

  @override
  Future<List<AppImageMetadata>?> uploadFiles({
    required List<PlatformFile> imageDataList,
  }) async {
    apiHttpClient.options.headers['Content-Type'] = 'multipart/form-data';
    final tokenManager = TokenManager();
    final String jsonData =
        jsonEncode({"user_id": tokenManager.userId}); // userId 변수 사용

    final formData = FormData.fromMap({
      "json_data": jsonData,
    });

    final filesToUpload = imageDataList
        .map(
          (imageData) => MapEntry(
            "images",
            MultipartFile.fromBytes(
              imageData.bytes!,
              filename: imageData.name,
            ),
          ),
        )
        .toList();

    formData.files.addAll(filesToUpload);

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
    apiHttpClient.options.headers['Content-Type'] = 'application/json';
    final pictureIds =
        imageMetadataList.map((e) => {"picture_id": e.pictureId}).toList();
    final formData = FormData.fromMap({"json_data": jsonEncode(pictureIds)});

    print({"json_data": pictureIds});

    final response = await apiHttpClient.delete(
      '/pictures',
      data: formData,
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> toggleBookmark({
    required AppImageMetadata imageMetadata,
  }) async {
    final response = await apiHttpClient
        .post('/pictures/bookmark/${imageMetadata.pictureId}', data: null);

    print(response.data);

    if (response.statusCode != 200) {
      print("bookmark status code: ${response.statusCode}");
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

  }
}
