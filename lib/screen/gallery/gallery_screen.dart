import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/image_item.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/gallery/widgets/thumnail_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({
    super.key,
  });

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imagePagingController =
        context.watch<AppImageProvider>().pagingController;
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => imagePagingController.refresh(),
      ),
      child: PagedGridView<int, ImageItem>(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: false,
        pagingController: imagePagingController,
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        builderDelegate: PagedChildBuilderDelegate<ImageItem>(
          firstPageErrorIndicatorBuilder: (context) => const Center(
            child: Text("Error"),
          ),
          newPageErrorIndicatorBuilder: (context) => const Center(
            child: Text("Error"),
          ),
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
