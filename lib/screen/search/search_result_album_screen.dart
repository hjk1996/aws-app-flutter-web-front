import 'package:flutter/material.dart';
import 'package:flutter_web/model/data_model/app_image_metadata.dart';
import 'package:flutter_web/model/repository/image_repository.dart';
import 'package:flutter_web/model/state_model/app_image_item.dart';
import 'package:flutter_web/model/state_model/search_result_album_state.dart';
import 'package:flutter_web/providers/search_provider.dart';
import 'package:flutter_web/providers/search_result_album_provider.dart';
import 'package:flutter_web/screen/search/widgets/search_image_grid.dart';
import 'package:flutter_web/screen/search/widgets/search_image_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class SearchResultAlbumScreen extends StatefulWidget {
  const SearchResultAlbumScreen({
    super.key,
    required this.imageMetadataList,
  });

  final List<AppImageMetadata> imageMetadataList;

  @override
  State<SearchResultAlbumScreen> createState() =>
      _SearchResultAlbumScreenState();
}

class _SearchResultAlbumScreenState extends State<SearchResultAlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          title: const Text('Search Result'),
        ),
        body: FutureBuilder<List<AppImageItem>?>(
          future: context.read<SearchProvider>().getImageThumbnailList(
              imageMetadataList: widget.imageMetadataList),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data == null) {
              return const Center(
                child: Text('Error Occurred'),
              );
            } else if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Image'),
              );
            } else {
              return SearchImageGrid(
                imageItemList: snapshot.data!,
                onTap: (index, imageItemList) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<SearchResultAlbumProvider>(
                      create: (context) => SearchResultAlbumProvider(
                        imageRepository: GetIt.instance.get<ImageRepository>(),
                        initialState: SearchResultAlbumState(
                            loading: false, currentImageIndex: index),
                        imageItemList: imageItemList,
                      ),
                      child: SearchImageScreen(
                        index: index,
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }
}
