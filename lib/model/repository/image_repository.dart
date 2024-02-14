import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';

abstract class ImageRepository {
  Future<List<AppImageMetadata>?> getImageMetadataList({
    required int limit,
    int? cursor,
    bool? bookmark,
  });

  Future<List<AppImageData>?> getThumbnailImageDataList({
    required List<String> imageUrls,
  });

  Future<Uint8List?> getOriginalImageBytes({
    required String imageUrl,
  });

  Future<List<AppImageMetadata>?> uploadFiles({
    required List<PlatformFile> imageDataList,
  });

  Future<void> deleteImages({
    required List<AppImageMetadata> imageMetadataList,
  });

  Future<void> toggleBookmark({
    required AppImageMetadata imageMetadata,
  });
}
