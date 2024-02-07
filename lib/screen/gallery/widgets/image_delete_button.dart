import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:provider/provider.dart';

class ImageDeleteButton extends StatefulWidget {
  const ImageDeleteButton({super.key});

  @override
  State<ImageDeleteButton> createState() => _ImageDeleteButtonState();
}

class _ImageDeleteButtonState extends State<ImageDeleteButton> {
  @override
  Widget build(BuildContext context) {
    return Selector<AppImageProvider, bool>(
      selector: (_, provider) => provider.state.selectMode,
      builder: (context, selectMode, child) {
        return Visibility(
          visible: selectMode,
          child: ElevatedButton(
            onPressed: () =>
                context.read<AppImageProvider>().deleteSelectedImage(),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
