import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/screen/gallery/widgets/thumbnail_widget.dart';

class ImageGrid extends StatefulWidget {
  const ImageGrid({super.key, required this.imageList});
  final List<AppImageItem> imageList;

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // 스크롤 가능한 영역에 패딩을 추가
      padding: const EdgeInsets.all(8),
      // 한 줄에 표시할 아이템의 개수를 지정
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 한 줄에 4개의 아이템
        crossAxisSpacing: 8, // 가로 간격
        mainAxisSpacing: 8, // 세로 간격
      ),
      // 아이템의 총 개수 (임의로 20개로 설정)
      itemCount: widget.imageList.length,
      // 각 아이템을 구성하는 방법
      itemBuilder: (context, index) {
        return Hero(
          tag: widget.imageList[index].imageMetadata.pictureId,
          child: ThumbnailWidget(
            key: ValueKey(widget.imageList[index].imageMetadata.pictureId),
            index: index,
            imageItem: widget.imageList[index],
          ),
        );
      },
    );
  }
}
