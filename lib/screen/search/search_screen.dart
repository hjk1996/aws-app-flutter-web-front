import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/search_state.dart';
import 'package:flutter_web/providers/search_provider.dart';
import 'package:flutter_web/screen/search/widgets/chat_message_widget.dart';
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
      body: Column(
        children: [
          // 메시지 목록 (콘텐츠)

          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
                bottom: chatInputHeight), // 입력창 높이만큼 padding
            child: ListView.builder(
              reverse: true,
              itemCount: 30, // 예시 메시지 개수
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          )),

          Row(
            children: [
              const QueryTypeSelectButton(),
              const SizedBox(width: 8.0),
              Expanded(
                  child: Container(
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
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {},
                    ),
                  ],
                ),
              ))
            ],
          ),
          Visibility(
            visible: context.select<SearchProvider, bool>(
              (provider) => provider.state.showQueryTypes,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: QueryType.values
                  .map((queryType) => QueryTypeButton(queryType: queryType))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
