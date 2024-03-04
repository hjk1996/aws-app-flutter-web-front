import 'package:flutter/material.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/state_model/app_image_data.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/image/widgets/image_info_modal.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MainAlbumImageScreen extends StatefulWidget {
  final int index;

  const MainAlbumImageScreen({super.key, required this.index});

  @override
  State<MainAlbumImageScreen> createState() => _MainAlbumImageScreenState();
}

class _MainAlbumImageScreenState extends State<MainAlbumImageScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppImageProvider>(
      builder: (context, provider, child) {
        final images = provider.pagingController.itemList ?? [];
        final currentIndex = provider.state.currentImageIndex;
        final currentMetadata = images.isNotEmpty && currentIndex != null
            ? images[currentIndex].imageMetadata
            : null;

        return Scaffold(
          appBar: AppBar(
            title: Text(_formatDate(currentMetadata?.createdAt)),
            actions: <Widget>[
              if (currentMetadata != null)
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: provider.deleteCurrentImage,
                ),
              if (currentMetadata != null)
                _infoButton(context, currentMetadata),
            ],
          ),
          body: Column(
            children: <Widget>[
              _imageViewer(provider, images, context),
              if (currentMetadata != null)
                _actionBar(provider, currentMetadata),
            ],
          ),
        );
      },
    );
  }

  Widget _infoButton(BuildContext context, AppImageMetadata? currentMetadata) {
    return IconButton(
      icon: const Icon(Icons.info),
      onPressed: currentMetadata == null
          ? null
          : () => showDialog(
                context: context,
                builder: (context) =>
                    ImageInfoDialog(imageMetadata: currentMetadata),
              ),
    );
  }

  String _formatDate(DateTime? date) {
    return date != null ? DateFormat.yMd().add_jm().format(date) : "";
  }

  Widget _imageViewer(
      AppImageProvider provider, List<dynamic> images, BuildContext context) {
    if (images.isEmpty) {
      return const Expanded(child: Center(child: Text("No images")));
    }
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: provider.setCurrentImageIndex,
        itemCount: images.length,
        itemBuilder: (context, index) => _imageWidget(provider, index),
      ),
    );
  }

  Widget _imageWidget(AppImageProvider provider, int index) {
    var imageData = provider.pagingController.itemList![index].imageData;
    return Hero(
      tag: provider.pagingController.itemList![index].imageMetadata.pictureId,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildImage(imageData, index),
      ),
    );
  }

  Widget _buildImage(AppImageData imageData, int index) {
    if (imageData.original != null) {
      return Image.memory(imageData.original!, key: ValueKey('original$index'));
    } else if (imageData.thumbnail != null) {
      return Image.memory(imageData.thumbnail!,
          key: ValueKey('thumbnail$index'));
    } else {
      return const Icon(Icons.image, key: ValueKey('icon'));
    }
  }

  Widget _actionBar(
      AppImageProvider provider, AppImageMetadata? currentMetadata) {
    return Container(
      color: Colors.amber,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              currentMetadata != null && currentMetadata.bookmarked
                  ? Icons.star
                  : Icons.star_border,
            ),
            onPressed: () async => await provider.toggleBookmark(),
          ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: provider.downloadCurrentImage,
          ),
        ],
      ),
    );
  }
}
