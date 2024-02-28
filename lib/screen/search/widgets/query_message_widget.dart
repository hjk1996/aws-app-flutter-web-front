import 'package:flutter/material.dart';
import 'package:flutter_web/model/data_model/query_request.dart';
import 'package:flutter_web/screen/search/widgets/chat_message_widget.dart';
import 'package:intl/intl.dart';

class QueryMessageWidget extends StatefulWidget implements ChatMessageWidget {
  const QueryMessageWidget({super.key, required this.queryRequest});
  final QueryRequest queryRequest;

  @override
  State<QueryMessageWidget> createState() => _QueryMessageWidgetState();
}

class _QueryMessageWidgetState extends State<QueryMessageWidget> {
  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(widget.queryRequest.createdAt);

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue], // 그라데이션 색상
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5), // 그림자 색상
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // 그림자 위치 조정
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(right: 10, bottom: 10), // 여백 추가
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.queryRequest.query,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
              ),
              SizedBox(height: 4), // 텍스트 사이의 간격 조정
              Text(
                "Query Type: ${widget.queryRequest.queryType.name}",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8)), // 스타일 조정
              ),
              Text(
                formattedDate,
                style: TextStyle(
                    fontSize: 12, color: Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
