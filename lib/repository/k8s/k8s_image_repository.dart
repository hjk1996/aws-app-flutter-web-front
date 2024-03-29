import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/data_model/tag_info.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
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
    final tokenManager = TokenManager();

    if (tokenManager.userId == null) {
      throw Exception("userId is null");
    }

    apiHttpClient.options.headers['Content-Type'] = 'application/json';
    final String userId = tokenManager.userId!;
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
  Future<List<AppImageData>?> getImageDataList({
    required List<String> imageUrls,
    required bool isThumbnail,
  }) async {
    final responses = await Future.wait(
      imageUrls.map((imageUrl) async {
        // Thumbnail 이미지 요청 시도
        if (isThumbnail) {
          var response = await s3HttpClient
              .get("/thumbnail/${tokenManager.userId}/$imageUrl");

          if (response.statusCode != 200) {
            // 실패 시 원본 이미지 요청
            response = await s3HttpClient
                .get("/original/${tokenManager.userId}/$imageUrl");
          }

          // 응답 처리
          return response;
        } else {
          var response = await s3HttpClient
              .get("/original/${tokenManager.userId}/$imageUrl");
          // 응답 처리
          return response;
        }

        // 응답 처리
      }).toList(),
      eagerError: false, // 하나의 Future가 실패해도 다른 Future의 결과를 기다립니다.
    );

    return responses
        .map(
          (response) => AppImageData(
            selected: false,
            thumbnail: response.statusCode == 200 && response.data != null
                ? response.data
                : null,
            original: response.statusCode == 200 && !isThumbnail
                ? response.data
                : null,
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

    final response = await apiHttpClient.delete(
      '/pictures/${tokenManager.userId}',
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

    if (response.statusCode != 200) {
      print("bookmark status code: ${response.statusCode}");
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<void> deleteAllImages() async {
    final response =
        await apiHttpClient.delete('/users/reset', queryParameters: {
      "user_id": tokenManager.userId,
    });

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<List<TagInfo>> loadUserTags() async {
    final response = await apiHttpClient.get(
      '/pictures/tagrank',
      queryParameters: {
        "user_id": tokenManager.userId,
      },
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    return (response.data["topTags"] as List)
        .map((e) => TagInfo.fromJson(e))
        .toList();
  }

  @override
  Future<List<AppImageItem>?> getImageByTag({
    required String tag,
  }) async {
    final response = await apiHttpClient.get(
      '/users/${tokenManager.userId}',
      queryParameters: {
        "tag": tag,
        "last": 0,
        "limit": 100,
      },
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    final imageMetadataList = (response.data["pictures"] as List)
        .map((e) => AppImageMetadata.fromJson(e))
        .toList();

    final imageUrls = imageMetadataList.map((e) => e.imageUrl).toList();

    final imaageDataList =
        await getImageDataList(imageUrls: imageUrls, isThumbnail: true);

    if (imaageDataList == null) {
      return null;
    }

    return imageMetadataList
        .asMap()
        .entries
        .map(
          (e) => AppImageItem(
            imageData: imaageDataList[e.key],
            imageMetadata: e.value,
          ),
        )
        .toList();
  }
}
