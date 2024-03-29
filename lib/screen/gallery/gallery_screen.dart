import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_event.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/gallery/widgets/image_delete_button.dart';
import 'package:flutter_web/screen/gallery/widgets/image_upload_button.dart';
import 'package:flutter_web/screen/gallery/widgets/select_all_button.dart';
import 'package:flutter_web/screen/gallery/widgets/select_toggle_button.dart';
import 'package:flutter_web/screen/gallery/widgets/main_album_thumbnail_widget.dart';
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
  late StreamSubscription<ImageEvent> _imageEventstreamSubscription;

  @override
  void initState() {
    _imageEventstreamSubscription =
        context.read<AppImageProvider>().imageEventStream.listen((event) {
      event.whenOrNull(
        error: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(e.toString()),
          ),
        ),
        onImageUploadSuccess: () {
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Image upload success',
                )),
          );
        },
        onImageDeleteSuccess: () {
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Image delete success',
                )),
          );
        },
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _imageEventstreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pagingController = context.read<AppImageProvider>().pagingController;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
        actions: [
          Selector<AppImageProvider, bool>(
            selector: (_, provider) =>
                provider.pagingController.itemList != null &&
                provider.pagingController.itemList!.isEmpty &&
                provider.state.selectMode,
            builder: (context, isEmpty, child) {
              return Visibility(
                  visible: isEmpty,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Load New Images")));
            },
          ),
          const ImageDeleteButton(),
          const SizedBox(
            width: 10,
          ),
          const SelectAllButton(),
          const GallerySelectToggleButton()
        ],
        title: const Text("Gallery"),
      ),
      floatingActionButton: const ImageUploadButton(),
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
              child: MainAlbumThumbnailWidget(
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
