import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/search_event.dart';
import 'package:flutter_web/providers/face_search_provider.dart';
import 'package:flutter_web/screen/face_search/widgets/face_search_image_grid.dart';
import 'package:provider/provider.dart';

class FaceSearchScreen extends StatefulWidget {
  static const routeName = 'face-search';

  const FaceSearchScreen({super.key});

  @override
  State<FaceSearchScreen> createState() => _FaceSearchScreenState();
}

class _FaceSearchScreenState extends State<FaceSearchScreen> {
  late StreamSubscription<SearchEvent> _eventStreamSubscription;

  @override
  void initState() {
    super.initState();
    _eventStreamSubscription =
        context.read<FaceSearchProvider>().eventStream.listen((event) {
      event.whenOrNull(
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _eventStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 입력창의 높이를 상수로 지정
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Search'),
      ),
      floatingActionButton: Consumer<FaceSearchProvider>(
        builder: (context, provider, child) => provider.state.loading
            ? const CircularProgressIndicator()
            : ElevatedButton.icon(
                onPressed: () async {
                  var picked = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png', 'zip'],
                  );
                  if (picked == null) {
                    return;
                  }
                  await provider.searchFaces(picked.files.first);
                },
                icon: const Icon(Icons.upload),
                label: const Text('Upload'),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Consumer<FaceSearchProvider>(
        builder: (context, provider, child) {
          if (provider.imageItemList.isEmpty) {
            return const Center(
              child: Text("No result found"),
            );
          } else {
            return const FaceSearchImageGrid();
          }
        },
      ),
    );
  }
}
