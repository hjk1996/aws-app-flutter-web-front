import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web/model/data_model/query_request.dart';
import 'package:flutter_web/model/data_model/query_response.dart';
import 'package:flutter_web/model/state_model/search_state.dart';
import 'package:flutter_web/providers/search_provider.dart';
import 'package:flutter_web/screen/search/widgets/query_message_widget.dart';
import 'package:flutter_web/screen/search/widgets/query_response_widget.dart';
import 'package:flutter_web/screen/search/widgets/query_type_button.dart';
import 'package:flutter_web/screen/search/widgets/query_type_select_button.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = 'search';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _queryController = TextEditingController();

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 입력창의 높이를 상수로 지정
    const double chatInputHeight = 60.0;

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
      ),
      body: Column(
        children: [
          // 메시지 목록 (콘텐츠)
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              bottom: chatInputHeight,
              left: 8.0,
              right: 8.0,
            ), // 입력창 높이만큼 padding
            child: Consumer<SearchProvider>(
              builder: (context, provider, child) => ListView.builder(
                itemCount: provider.state.chatList.length, // 예시 메시지 개수
                itemBuilder: (context, index) {
                  final item = provider.state.chatList[index];
                  if (item is QueryRequest) {
                    return QueryMessageWidget(queryRequest: item);
                  } else if (item is QueryResponse) {
                    return QueryResponseWidget(queryResponse: item);
                  } else {
                    // 기본값이나 오류 위젯을 반환하거나, 다른 처리를 할 수 있습니다.
                    return const Text('Unknown item type');
                  }
                },
              ),
            ),
          )),
          Container(
            height: chatInputHeight,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _queryController,
                    decoration: const InputDecoration(
                      hintText: "Enter your message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Selector<SearchProvider, bool>(
                  selector: (_, provider) => provider.state.loading,
                  builder: (context, loading, child) => loading
                      ? const CircularProgressIndicator()
                      : IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () async {
                            final query = _queryController.text;
                            print(query);
                            if (query.isNotEmpty) {
                              await context
                                  .read<SearchProvider>()
                                  .hanldleQuery(query: query);
                              _queryController.clear();
                            }
                          },
                        ),
                ),
              ],
            ),
          ),
          // Visibility(
          //   visible: context.select<SearchProvider, bool>(
          //     (provider) => provider.state.showQueryTypes,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: QueryType.values
          //         .map((queryType) => QueryTypeButton(queryType: queryType))
          //         .toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
