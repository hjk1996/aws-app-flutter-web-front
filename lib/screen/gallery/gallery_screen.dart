import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/image_item.dart';
import 'package:flutter_web/screen/gallery/widgets/thumnail_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GalleryScreen extends StatefulWidget {
  final PagingController<int, ImageItem> pagingController;
  const GalleryScreen({
    super.key,
    required this.pagingController,
  });

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => widget.pagingController.refresh(),
      ),
      child: PagedGridView<int, ImageItem>(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: false,
        pagingController: widget.pagingController,
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        builderDelegate: PagedChildBuilderDelegate<ImageItem>(
          itemBuilder: (context, item, index) => Hero(
            tag: item.imageMetadata.id,
            child: ThumnailWidget(
              key: ValueKey(item.imageMetadata.id),
              index: index,
              imageItem: item,
            ),
          ),
        ),
      ),
    );
  }
}
