import 'package:flutter/material.dart';
import 'package:flutter_web/providers/face_search_provider.dart';
import 'package:flutter_web/screen/face_search/widgets/face_search_image_screen.dart';
import 'package:flutter_web/screen/common/thumnail_widget.dart';
import 'package:provider/provider.dart';

class FaceSearchImageGrid extends StatefulWidget {
  const FaceSearchImageGrid({super.key});

  @override
  State<FaceSearchImageGrid> createState() => _FaceSearchImageGridState();
}

class _FaceSearchImageGridState extends State<FaceSearchImageGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FaceSearchProvider>(
      builder: (context, provider, child) => GridView.builder(
        // 스크롤 가능한 영역에 패딩을 추가
        padding: const EdgeInsets.all(8),
        // 한 줄에 표시할 아이템의 개수를 지정
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 한 줄에 4개의 아이템
          crossAxisSpacing: 8, // 가로 간격
          mainAxisSpacing: 8, // 세로 간격
        ),
        // 아이템의 총 개수 (임의로 20개로 설정)
        itemCount: provider.imageItemList.length,
        // 각 아이템을 구성하는 방법
        itemBuilder: (context, index) {
          return Hero(
              tag: provider.imageItemList[index].imageMetadata.pictureId,
              child: ThumbnailWidget(
                key: ValueKey(
                  provider.imageItemList[index].imageMetadata.pictureId,
                ),
                index: index,
                imageItem: provider.imageItemList[index],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaceSearchImageScreen(
                      index: index,
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
