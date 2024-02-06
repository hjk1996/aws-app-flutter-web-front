import 'package:flutter/material.dart';
import 'package:flutter_web/screen/gallery/gallery_screen.dart';

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
        body: Column(
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
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text("Search"),
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
            onPressed: () {},
            icon: const Icon(Icons.settings),
            label: const Text("Setting"),
            style: ElevatedButton.styleFrom(
              minimumSize: buttonSize,
            ),
          ),
        ),
      ],
    ));
  }
}
