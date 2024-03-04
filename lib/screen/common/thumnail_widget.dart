import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/image/main_album_image_screen.dart';
import 'package:provider/provider.dart';

class ThumbnailWidget extends StatefulWidget {
  const ThumbnailWidget({
    super.key,
    required this.index,
    required this.imageItem,
    required this.onTap,
  });

  final int index;
  final AppImageItem imageItem;
  final void Function() onTap;

  @override
  State<ThumbnailWidget> createState() =>
      _ThumbnailWidgetState();
}

class _ThumbnailWidgetState extends State<ThumbnailWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent,
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
}
