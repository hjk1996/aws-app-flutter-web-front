import 'package:flutter/material.dart';
import 'package:flutter_web/model/data_model/image_metadata.dart';

class ImageInfoDialog extends StatelessWidget {
  const ImageInfoDialog({super.key, required this.imageMetadata});
  final ImageMetadata imageMetadata;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 8),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            )
          ],
        ),
      ),
    );
  }
}
