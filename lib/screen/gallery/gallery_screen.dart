import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_event.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/gallery/widgets/thumnail_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  static const routeName = 'gallery';

  const GalleryScreen({
    super.key,
  });

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final PagingController<int, AppImageItem> pagingController = PagingController(
    firstPageKey: 1,
  );
  late StreamSubscription<ImageEvent> _imageEventstreamSubscription;

  @override
  void initState() {
    _imageEventstreamSubscription =
        context.read<AppImageProvider>().imageEventStream.listen((event) {
      event.whenOrNull(
        error: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        ),
        onImageUploadSuccess: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Image upload success',
              )),
        ),
      );
    });

    pagingController.addPageRequestListener((pageKey) {
      context.read<AppImageProvider>().getNextPage(
            pagingController: pagingController,
            pageKey: pageKey,
          );
    });
    super.initState();
  }

  @override
  void dispose() {
    _imageEventstreamSubscription.cancel();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await context
            .read<AppImageProvider>()
            .uploadFiles(pagingController),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => pagingController.refresh(),
        ),
        child: PagedGridView<int, AppImageItem>(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
          pagingController: pagingController,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
          ),
          builderDelegate: PagedChildBuilderDelegate<AppImageItem>(
            firstPageErrorIndicatorBuilder: (context) => const Center(
              child: Text("Error"),
            ),
            newPageErrorIndicatorBuilder: (context) => const Center(
              child: Text("Error"),
            ),
            itemBuilder: (context, item, index) => Hero(
              tag: item.imageMetadata.pictureId,
              child: ThumnailWidget(
                key: ValueKey(item.imageMetadata.pictureId),
                index: index,
                imageItem: item,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
