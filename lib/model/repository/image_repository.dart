import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';

abstract class ImageRepository {
  Future<List<AppImageMetadata>?> getImageMetadataList({
    required int limit,
    int? afterThisImageId,
  });

  Future<List<AppImageData>?> getThumbnailImageDataList({
    required List<AppImageMetadata> imageMetadataList,
  });

  Future<List<Uint8List?>> getOriginalImageByteList({
    required List<AppImageItem> originalImageDataList,
  });

  Future<List<AppImageMetadata>?> uploadFiles({
    required List<PlatformFile> imageDataList,
  });

  Future<void> deleteImages({
    required List<AppImageMetadata> imageMetadataList,
  });

  Future<bool> toggleFavorite({
    required AppImageMetadata imageMetadata,
  });
}
