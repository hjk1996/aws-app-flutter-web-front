import 'package:flutter/material.dart';
import 'package:flutter_web/providers/image_tag_list_provider.dart';
import 'package:flutter_web/screen/image_tag_album/image_tag_album_screen.dart';
import 'package:provider/provider.dart';

class ImageTagListScreen extends StatefulWidget {
  static const routeName = '/image-tag-list';
  const ImageTagListScreen({super.key});

  @override
  State<ImageTagListScreen> createState() => _ImageTagListScreenState();
}

class _ImageTagListScreenState extends State<ImageTagListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Tag List'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/');
            }
          },
        ),
      ),
      body: FutureBuilder<void>(
        future: context.read<ImageTagListProvider>().loadUserTags(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<ImageTagListProvider>(
              builder: (context, provider, child) => ListView.builder(
                itemCount: provider.state.tags.length,
                itemBuilder: (context, index) => Card(
                  elevation: 4.0, // 그림자 효과를 위한 높이
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0), // 카드 간격 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // 카드 모서리 둥글게
                  ),
                  color: Colors.blue.shade100, // 카드 배경색 설정
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0), // ListTile 내부 패딩
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade300, // CircleAvatar 배경색
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(color: Colors.white), // 숫자 색상
                      ),
                    ),
                    title: Text(
                      "${provider.state.tags[index].tag} (${provider.state.tags[index].count})",
                      style: TextStyle(color: Colors.blue.shade800), // 타이틀 색상
                    ),
                    trailing: IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageTagAlbumScreen(
                            tagInfo: provider.state.tags[index],
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.blue), // 아이콘 색상
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
