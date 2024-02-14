import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/providers/face_search_provider.dart';
import 'package:flutter_web/screen/gallery/widgets/thumbnail_widget.dart';
import 'package:flutter_web/screen/search/widgets/chat_message_widget.dart';
import 'package:provider/provider.dart';

class FaceSearchScreen extends StatefulWidget {
  static const routeName = 'face-search';

  const FaceSearchScreen({super.key});

  @override
  State<FaceSearchScreen> createState() => _FaceSearchScreenState();
}

class _FaceSearchScreenState extends State<FaceSearchScreen> {
  @override
  void dispose() {
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
                    allowedExtensions: ['jpg', 'png', 'jpeg', 'zip'],
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
          if (provider.state.searchResult == null) {
            return const Center(
              child: Text("Please upload an image"),
            );
          } else if (provider.state.searchResult!.isEmpty) {
            return const Center(
              child: Text("No result found"),
            );
          } else {
            return GridView.builder(
              // 스크롤 가능한 영역에 패딩을 추가
              padding: const EdgeInsets.all(8),
              // 한 줄에 표시할 아이템의 개수를 지정
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 한 줄에 4개의 아이템
                crossAxisSpacing: 8, // 가로 간격
                mainAxisSpacing: 8, // 세로 간격
              ),
              // 아이템의 총 개수 (임의로 20개로 설정)
              itemCount: provider.state.searchResult!.length,
              // 각 아이템을 구성하는 방법
              itemBuilder: (context, index) {
                return Hero(
                  tag: provider
                      .state.searchResult![index].imageMetadata.pictureId,
                  child: ThumbnailWidget(
                    key: ValueKey(provider
                        .state.searchResult![index].imageMetadata.pictureId),
                    index: index,
                    imageItem: provider.state.searchResult![index],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
