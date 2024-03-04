import 'package:flutter/material.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/model/state_model/search_result_album_state.dart';
import 'package:flutter_web/providers/search_result_album_provider.dart';
import 'package:flutter_web/screen/search/widgets/search_image_screen.dart';
import 'package:flutter_web/screen/common/thumnail_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class SearchImageGrid extends StatefulWidget {
  const SearchImageGrid({super.key, required this.imageItemList});
  final List<AppImageItem> imageItemList;

  @override
  State<SearchImageGrid> createState() => _SearchImageGridState();
}

class _SearchImageGridState extends State<SearchImageGrid> {
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
      itemCount: widget.imageItemList.length,
      // 각 아이템을 구성하는 방법
      itemBuilder: (context, index) {
        return Hero(
            tag: widget.imageItemList[index].imageMetadata.pictureId,
            child: ThumbnailWidget(
              key:
                  ValueKey(widget.imageItemList[index].imageMetadata.pictureId),
              index: index,
              imageItem: widget.imageItemList[index],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<SearchResultAlbumProvider>(
                          create: (context) => SearchResultAlbumProvider(
                            imageRepository:
                                GetIt.instance.get<ImageRepository>(),
                            initialState: SearchResultAlbumState(
                                loading: false, currentImageIndex: index),
                            imageItemList: widget.imageItemList,
                          ),
                          child: SearchImageScreen(
                            index: index,
                          ),
                        )),
              ),
            ));
      },
    );
  }
}
