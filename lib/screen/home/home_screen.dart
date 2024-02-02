import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_event.dart';
import 'package:flutter_web/model/state_model/image_item.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/screen/gallery/gallery_screen.dart';
import 'package:flutter_web/screen/search/search_screen.dart';
import 'package:flutter_web/screen/setting/setting_screen.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _queryController = TextEditingController();
  int _currentPageIndex = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _selectedIndex = 0;

  late StreamSubscription<ImageEvent> _imageEventstreamSubscription;

  @override
  void initState() {
    _pageController.addListener(_updatePageIndex);

    _imageEventstreamSubscription =
        context.read<AppImageProvider>().imageEventStream.listen((event) {
      event.whenOrNull(
        error: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        ),
        onImageUploadSuccess: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image upload success')),
        ),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _queryController.dispose();
    _pageController.removeListener(_updatePageIndex);
    _pageController.dispose();
    _imageEventstreamSubscription.cancel();
    super.dispose();
  }

  void _updatePageIndex() {
    int newPageIndex = _pageController.page!.round();
    if (newPageIndex != _currentPageIndex) {
      setState(() {
        _currentPageIndex = newPageIndex;
      });
    }
  }

  String _getTitleForCurrentPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 'Gallery';
      case 1:
        return 'Search';
      case 2:
        return 'Setting';
      default:
        return 'Title';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: const [
            GalleryScreen(),
            SearchScreen(),
            SettingScreen(),
          ],
        ),
        floatingActionButton: _currentPageIndex == 0
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async =>
                    await context.read<AppImageProvider>().uploadFiles(),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Gallery'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Setting'),
          ],
        ));
  }
}
