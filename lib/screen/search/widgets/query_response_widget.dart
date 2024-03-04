import 'package:flutter/material.dart';
import 'package:flutter_web/model/data_model/query_response.dart';
import 'package:flutter_web/screen/search/search_result_album_screen.dart';
import 'package:flutter_web/screen/search/widgets/chat_message_widget.dart';
import 'package:intl/intl.dart';

class QueryResponseWidget extends StatefulWidget implements ChatMessageWidget {
  const QueryResponseWidget({super.key, required this.queryResponse});
  final QueryResponse queryResponse;

  @override
  State<QueryResponseWidget> createState() => _QueryResponseWidgetState();
}

class _QueryResponseWidgetState extends State<QueryResponseWidget> {
  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(widget.queryResponse.createdAt);
    final bool hasImages = widget.queryResponse.imageMetadataList.isNotEmpty;

    return Align(
      alignment: Alignment.centerLeft,
      child: IntrinsicWidth(
          child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.queryResponse.imageMetadataList.length} images found",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                    const SizedBox(height: 4),
                    // Text(
                    //   "Query Type: ${widget.queryResponse.queryType.name}",
                    //   style: TextStyle(
                    //       fontSize: 12, color: Colors.white.withOpacity(0.8)),
                    // ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                          fontSize: 12, color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
              if (hasImages) // 검색 결과가 있을 때만 버튼 표시
                Row(
                  children: [
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.photo_album, color: Colors.white),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResultAlbumScreen(
                            imageMetadataList:
                                widget.queryResponse.imageMetadataList,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      )),
    );
  }
}
