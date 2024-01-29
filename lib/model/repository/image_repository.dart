import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:flutter_web/model/state_model/image_data.dart';

abstract class ImageRepository {
  Future<(List<ImageMetadata>, List<ImageData>)> getImages({
    required int limit,
    int? afterThisImageId,
  });

  Future<bool> uploadFiles({
    required List<PlatformFile> imageDataList,
  });

  Future<bool> deleteImages({
    required List<ImageMetadata> imageMetadataList,
  });

  Future<bool> toggleFavorite({
    required ImageMetadata imageMetadata,
  });
}
