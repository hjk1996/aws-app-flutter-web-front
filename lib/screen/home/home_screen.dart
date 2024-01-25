import 'package:flutter/material.dart';
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
  final PageController _pageViewController = PageController(
    initialPage: 0,
  );
  int _selectedIndex = 0;

  late final PagingController<int, ImageItem> pagingController;

  @override
  void initState() {
    pagingController = PagingController<int, ImageItem>(firstPageKey: 1);
    pagingController.addPageRequestListener(
        (pageKey) => context.read<AppImageProvider>().getNextPage(
              pagingController: pagingController,
              pageKey: pageKey,
            ));
    super.initState();
  }

  @override
  void dispose() {
    _queryController.dispose();
    _pageViewController.dispose();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageViewController,
          children: [
            GalleryScreen(
              pagingController: pagingController,
            ),
            const SearchScreen(),
            const SettingScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageViewController.animateToPage(index,
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
