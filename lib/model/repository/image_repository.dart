import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:flutter_web/model/state_model/image_data.dart';

abstract class ImageRepository {
  Future<(List<ImageMetadata>, List<ImageData>)> getImages({
    required int limit,
    int? lastImageId,
  });

  Future<bool> deleteImages({
    required List<ImageMetadata> imageMetadataList,
  });

  Future<bool> toggleFavorite({
    required ImageMetadata imageMetadata,
  });
}
