import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:flutter_web/screen/face_search/face_search_screen.dart';
import 'package:flutter_web/screen/gallery/gallery_screen.dart';
import 'package:flutter_web/screen/image_tag_list/image_tag_list_screen.dart';
import 'package:flutter_web/screen/search/search_screen.dart';
import 'package:flutter_web/screen/setting/setting_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size buttonSize = const Size(400, 100);

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () =>
                  Navigator.of(context).pushNamed(GalleryScreen.routeName),
              icon: const Icon(Icons.photo_album),
              label: const Text("Gallery"),
              style: ElevatedButton.styleFrom(
                minimumSize: buttonSize,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SearchScreen.routeName),
              icon: const Icon(Icons.chat),
              label: const Text("Semantic Search"),
              style: ElevatedButton.styleFrom(
                minimumSize: buttonSize,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () =>
                  Navigator.of(context).pushNamed(ImageTagListScreen.routeName),
              icon: const Icon(Icons.tag),
              label: const Text("Image Tag List"),
              style: ElevatedButton.styleFrom(
                minimumSize: buttonSize,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FaceSearchScreen(),
                ),
              ),
              icon: const Icon(Icons.face_5_outlined),
              label: const Text("Face Search"),
              style: ElevatedButton.styleFrom(
                minimumSize: buttonSize,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SettingScreen.routeName),
              icon: const Icon(Icons.settings),
              label: const Text("Setting"),
              style: ElevatedButton.styleFrom(
                minimumSize: buttonSize,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () async =>
                  await context.read<AppAuthProvider>().signOut(),
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                minimumSize: buttonSize,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
