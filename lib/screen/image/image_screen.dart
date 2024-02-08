import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/image/widgets/image_info_modal.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key, required this.index});

  final int index;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppImageProvider>(builder: (context, provider, child) {
      final currentImageMetadata =
          provider.state.imageMetadataList[provider.state.currentImageIndex!];

      return Scaffold(
        appBar: AppBar(
          title: Text(
            DateFormat.yMd().add_jm().format(currentImageMetadata.createdAt),
          ),
          actions: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) =>
                    ImageInfoDialog(imageMetadata: currentImageMetadata),
              ),
              icon: const Icon(Icons.info),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) async =>
                    await provider.setCurrentImageIndex(value),
                scrollDirection: Axis.horizontal,
                itemCount: provider.state.imageMetadataList.length,
                itemBuilder: (context, index) => Hero(
                  tag: provider.pagingController.itemList![index].imageMetadata
                      .pictureId,
                  child: Builder(
                    builder: (context) {
                      if (provider.pagingController.itemList![index].imageData
                              .original !=
                          null) {
                        return Image.memory(
                          provider.pagingController.itemList![index].imageData
                              .original!,
                        );
                      }

                      if (provider.pagingController.itemList![index].imageData
                              .thumbnail !=
                          null) {
                        return Image.memory(
                          provider.pagingController.itemList![index].imageData
                              .thumbnail!,
                        );
                      }
                      return const Icon(Icons.image);
                    },
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.amber,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(currentImageMetadata.bookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
