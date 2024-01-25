import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/gallery/widgets/thumnail_widget.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppImageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Container(),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info),
              ),
            ],
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.bookmark),
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
      },
    );
  }
}
