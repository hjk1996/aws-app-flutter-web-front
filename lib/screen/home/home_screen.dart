import 'package:file_picker/file_picker.dart';
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
  int _currentPageIndex = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _selectedIndex = 0;

  late final PagingController<int, ImageItem> imagePagingController;

  @override
  void initState() {
    imagePagingController = PagingController<int, ImageItem>(firstPageKey: 1);
    _pageController.addListener(_updatePageIndex);
    imagePagingController.addPageRequestListener(
        (pageKey) => context.read<AppImageProvider>().getNextPage(
              pagingController: imagePagingController,
              pageKey: pageKey,
            ));
    super.initState();
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
  void dispose() {
    _queryController.dispose();
    _pageController.removeListener(_updatePageIndex);
    _pageController.dispose();
    imagePagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            GalleryScreen(
              pagingController: imagePagingController,
            ),
            const SearchScreen(),
            const SettingScreen(),
          ],
        ),
        floatingActionButton: _currentPageIndex == 0
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  var picked = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png', 'jpeg', 'zip'],
                    allowMultiple: true,
                  );
                  if (picked != null) {
                    await context.read<AppImageProvider>().uploadFiles(
                          pagingController: imagePagingController,
                          files: picked.files,
                        );
                  }
                },
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
