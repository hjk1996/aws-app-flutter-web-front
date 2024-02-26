import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:provider/provider.dart';

class GallerySelectToggleButton extends StatefulWidget {
  const GallerySelectToggleButton({super.key});

  @override
  State<GallerySelectToggleButton> createState() =>
      _GallerySelectToggleButtonState();
}

class _GallerySelectToggleButtonState extends State<GallerySelectToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Selector<AppImageProvider, bool>(
        selector: (_, provider) => provider.state.selectMode,
        builder: (context, selectMode, child) => ElevatedButton(
            onPressed: () =>
                context.read<AppImageProvider>().toggleSelectMode(),
            child: selectMode ? const Text('Cancel') : const Text('Select')));
  }
}
