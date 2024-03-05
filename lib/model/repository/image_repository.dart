import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/data_model/tag_info.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';

abstract class ImageRepository {
  Future<List<AppImageMetadata>?> getImageMetadataList({
    required int limit,
    int? cursor,
    bool? bookmark,
  });

  Future<List<AppImageData>?> getImageDataList({
    required List<String> imageUrls,
    required bool isThumbnail,
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

  Future<void> deleteAllImages();

  Future<List<TagInfo>> loadUserTags();

  Future<List<AppImageItem>?> getImageByTag({
    required String tag,
  });
}
