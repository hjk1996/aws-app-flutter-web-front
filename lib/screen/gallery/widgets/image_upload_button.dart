import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/utils/token_manager.dart';
import 'package:provider/provider.dart';

class ImageUploadButton extends StatefulWidget {
  const ImageUploadButton({super.key});

  @override
  State<ImageUploadButton> createState() => _ImageUploadButtonState();
}

class _ImageUploadButtonState extends State<ImageUploadButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (_loading) {
          return const CircularProgressIndicator();
        } else {
          return FloatingActionButton(
            onPressed: () async {
              var picked = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png', 'jpeg', 'zip'],
                allowMultiple: true,
              );

              if (picked == null) {
                return;
              }

              setState(() {
                _loading = true;
              });

              if (mounted) {
                await context.read<AppImageProvider>().uploadFiles(picked);
              }

              setState(() {
                _loading = false;
              });
            },
            child: const Icon(Icons.add),
          );
        }
      },
    );
  }
}
