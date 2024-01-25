import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_web/model/data_model/image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/image_data.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart' show rootBundle;

class LocalImageRepository implements ImageRepository {
  @override
  Future<(List<ImageMetadata>, List<ImageData>)> getImages({
    required int limit,
    int? lastImageId,
  }) async {
    Random random = Random();

    // 랜덤한 색상의 이미지를 생성하는 함수
    Uint8List generateRandomImage(int size) {
      final image = img.Image(width: size, height: size);
      return Uint8List.fromList(img.encodePng(image));
    }

    final ByteData data = await rootBundle.load("assets/images/test.jpeg");
    data.buffer.asUint8List();
    final byteData = data.buffer.asUint8List();

    // ImageData 리스트 생성
    List<ImageData> imageDataList = List.generate(
      limit,
      (index) {
        return ImageData(
          selected: random.nextBool(),
          thumbnail: byteData,
          original: null,
        );
      },
    );

    List<ImageMetadata> imageMetadataList = [];

    for (int i = 0; i < limit; i++) {
      // 랜덤 ID 생성 (예시로 1부터 1000 사이)
      int id = random.nextInt(1000) + 1;

      // 랜덤 사용자 ID 생성 (UUID 형식을 사용하거나 간단한 숫자/문자열로 구성 가능)
      String userId = 'test_user';

      // 랜덤 이미지 이름 생성
      String imageName = 'image_${random.nextInt(100)}.png';

      // 랜덤 즐겨찾기 상태 생성
      bool bookmark = random.nextBool();

      // 랜덤 생성 날짜 (현재 날짜에서 -100일 ~ 현재 날짜 사이)
      DateTime createdAt =
          DateTime.now().subtract(Duration(days: random.nextInt(100)));

      // ImageMetadata 인스턴스 생성
      ImageMetadata metadata = ImageMetadata(
        id: id,
        userId: userId,
        imageName: imageName,
        bookmark: bookmark,
        createdAt: createdAt,
      );

      imageMetadataList.add(metadata);
    }

    return (imageMetadataList, imageDataList);
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
