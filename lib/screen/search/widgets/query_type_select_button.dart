import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/search_state.dart';
import 'package:flutter_web/providers/search_provider.dart';
import 'package:provider/provider.dart';

class QueryTypeSelectButton extends StatefulWidget {
  const QueryTypeSelectButton({super.key});

  @override
  State<QueryTypeSelectButton> createState() => _QueryTypeSelectButtonState();
}

class _QueryTypeSelectButtonState extends State<QueryTypeSelectButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, child) {
        late final Color backgroundColor;
        late final IconData buttonIcon;

        switch (provider.state.queryType) {
          case QueryType.normal:
            backgroundColor = Colors.white;
            buttonIcon = Icons.text_fields;
            break;
          case QueryType.semantic:
            backgroundColor = Colors.blue;
            buttonIcon = Icons.analytics;
            break;
        }

        return Padding(
            padding: const EdgeInsets.all(8),
            child: IconButton(
              onPressed: () => provider.toggleShowQueryTypes(),
              style: ButtonStyle(
                iconSize: MaterialStateProperty.all(30),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
              icon: Icon(buttonIcon),
            ));
      },
    );
  }
}
