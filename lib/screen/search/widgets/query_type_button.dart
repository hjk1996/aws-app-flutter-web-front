import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/search_state.dart';
import 'package:flutter_web/providers/search_provider.dart';
import 'package:provider/provider.dart';

class QueryTypeButton extends StatefulWidget {
  const QueryTypeButton({super.key, required this.queryType});
  final QueryType queryType;

  @override
  State<QueryTypeButton> createState() => _QueryTypeButtonState();
}

class _QueryTypeButtonState extends State<QueryTypeButton> {
  @override
  Widget build(BuildContext context) {
    late final Color backgroundColor;
    late final IconData buttonIcon;
    late final String buttonText;

    switch (widget.queryType) {
      case QueryType.normal:
        backgroundColor = Colors.white;
        buttonIcon = Icons.text_fields;
        buttonText = "Normal Search";
        break;
      case QueryType.semantic:
        backgroundColor = Colors.blue;
        buttonIcon = Icons.analytics;
        buttonText = "Semantic Search";
        break;
    }
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            IconButton(
              onPressed: () =>
                  context.read<SearchProvider>().setQueryType(widget.queryType),
              style: ButtonStyle(
                iconSize: MaterialStateProperty.all(30),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
              icon: Icon(buttonIcon),
            ),
            Text(buttonText),
          ],
        ));
  }
}
