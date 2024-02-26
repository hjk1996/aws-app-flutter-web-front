import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/data_model/query_response.dart';
import 'package:flutter_web/model/repository/search_repository.dart';
import 'package:flutter_web/utils/token_manager.dart';

class K8sSearchRepository implements SearchRepository {
  const K8sSearchRepository({
    required this.apiHttpClient,
    required this.tokenManager,
  });
  @override
  final Dio apiHttpClient;
  @override
  final TokenManager tokenManager;

  @override
  Future<QueryResponse> semanticSearch({
    required String query,
  }) async {
    final response = await apiHttpClient.get(
      "search/semantic",
      queryParameters: {
        "query": query,
      },
    );
    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    if (response.data["error"] != null) {
      throw DioException(
          requestOptions: response.requestOptions, response: response);
    }

    return QueryResponse.fromJson(response.data);
  }

  @override
  Future<List<AppImageMetadata>> searchFaces(PlatformFile file) async {
    apiHttpClient.options.headers['Content-Type'] = 'multipart/form-data';
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        file.bytes!,
        filename: file.name,
      ),
    });

    final response = await apiHttpClient.post(
      "search/faces",
      data: formData,
    );

    if (response.statusCode != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }

    print("response statusCode: ${response.statusCode}");
    print("response.data: ${response.data}");

    return (response.data["result"] as List)
        .map((e) => AppImageMetadata.fromJson(e))
        .toList();
  }
}
