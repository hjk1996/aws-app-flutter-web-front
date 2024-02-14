import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/utils/token_manager.dart';

abstract class SearchRepository {
  final Dio apiHttpClient;
  final TokenManager tokenManager;
  SearchRepository({
    required this.apiHttpClient,
    required this.tokenManager,
  });

  Future<List<AppImageMetadata>> searchFaces(PlatformFile file);
}
