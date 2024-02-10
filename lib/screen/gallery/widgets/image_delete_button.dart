import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:provider/provider.dart';

class ImageDeleteButton extends StatefulWidget {
  const ImageDeleteButton({super.key});

  @override
  State<ImageDeleteButton> createState() => _ImageDeleteButtonState();
}

class _ImageDeleteButtonState extends State<ImageDeleteButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<AppImageProvider, bool>(
          (provider) => provider.state.selectMode),
      child: Builder(
        builder: (context) {
          if (_loading) {
            return const CircularProgressIndicator();
          } else {
            return ElevatedButton(
              onPressed: () async {
                setState(() {
                  _loading = true;
                });
                await context.read<AppImageProvider>().deleteSelectedImage();
                setState(() {
                  _loading = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
