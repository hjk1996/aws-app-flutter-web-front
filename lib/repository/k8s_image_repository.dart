import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/image_data.dart';
import 'package:flutter_web/utils/token_manager.dart';

class K8sImageRepository implements ImageRepository {
  final Dio httpClient;

  K8sImageRepository({
    required this.httpClient,
  });

  @override
  Future<(List<ImageMetadata>, List<ImageData>)> getImages({
    required int limit,
    int? afterThisImageId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> uploadFiles({
    required List<PlatformFile> imageDataList,
  }) async {
    httpClient.options.headers['Content-Type'] = 'multipart/form-data';
    final tokenManager = TokenManager();
    final idToken = tokenManager.getDecodedToken(TokenType.id);
    final userId = idToken['cognito:username'];
    final formData = FormData.fromMap(
      {
        "json_data": {
          "user_id": userId,
        },
        "files": imageDataList.map((imageData) {
          return MultipartFile.fromBytes(
            imageData.bytes!,
            filename: imageData.name,
          );
        }).toList(),
      },
    );

    final response = await httpClient.post(
      '/pictures',
      data: formData,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> deleteImages({
    required List<ImageMetadata> imageMetadataList,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> toggleFavorite({
    required ImageMetadata imageMetadata,
  }) async {
    throw UnimplementedError();
  }
}
