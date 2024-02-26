import 'package:flutter/material.dart';
import 'package:flutter_web/model/data_model/query_request.dart';
import 'package:flutter_web/screen/search/widgets/chat_message_widget.dart';

class QueryMessageWidget extends StatefulWidget implements ChatMessageWidget {
  const QueryMessageWidget({super.key, required this.queryRequest});
  final QueryRequest queryRequest;

  @override
  State<QueryMessageWidget> createState() => _QueryMessageWidgetState();
}

class _QueryMessageWidgetState extends State<QueryMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Text(
                widget.queryRequest.query,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(widget.queryRequest.queryType.toString(),
                  style: const TextStyle(fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}
