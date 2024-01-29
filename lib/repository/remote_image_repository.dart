import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/image_data.dart';

class RemoteImageRepository implements ImageRepository {
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
    throw UnimplementedError();
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
