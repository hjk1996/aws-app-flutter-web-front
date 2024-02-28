import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/image/image_screen.dart';
import 'package:provider/provider.dart';

class ThumbnailWidget extends StatefulWidget {
  const ThumbnailWidget(
      {super.key, required this.index, required this.imageItem});

  final int index;
  final AppImageItem imageItem;

  @override
  State<ThumbnailWidget> createState() => _ThumbnailWidgetState();
}

class _ThumbnailWidgetState extends State<ThumbnailWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppImageProvider>(
      builder: (context, provider, child) {
        // select 모드일 때
        if (provider.state.selectMode) {
          return GestureDetector(
              onTap: () {
                provider.toggleImageItemSelection(widget.index);
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            provider.selectedImageIndexes.contains(widget.index)
                                ? Colors.blue
                                : Colors.transparent,
                        width: 4,
                      ),
                    ),
                    child: Image.memory(
                      widget.imageItem.imageData.thumbnail ?? Uint8List(0),
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (provider.selectedImageIndexes.contains(widget.index))
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ));
          // select mode 아닐 때
        } else {
          return GestureDetector(
            onTap: () {
              provider.setCurrentImageIndex(widget.index);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ImageScreen(index: widget.index),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: provider.selectedImageIndexes.contains(widget.index)
                      ? Colors.blue
                      : Colors.transparent,
                  width: 4,
                ),
              ),
              child: Image.memory(
                widget.imageItem.imageData.thumbnail ?? Uint8List(0),
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      },
    );
  }
}
