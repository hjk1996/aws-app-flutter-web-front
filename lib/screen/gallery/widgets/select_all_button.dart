import 'package:flutter/material.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:provider/provider.dart';

class SelectAllButton extends StatefulWidget {
  const SelectAllButton({super.key});

  @override
  State<SelectAllButton> createState() => _SelectAllButtonState();
}

class _SelectAllButtonState extends State<SelectAllButton> {
  bool _selectAll = false;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<AppImageProvider, bool>(
          (provider) => provider.state.selectMode),
      child: Builder(
        builder: (context) {
          return Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectAll = !_selectAll;
                  });
                  if (_selectAll) {
                    context.read<AppImageProvider>().selectAllImages();
                  } else {
                    context.read<AppImageProvider>().deselectAllImages();
                  }
                },
                style: ElevatedButton.styleFrom(),
                child: Text(
                  _selectAll ? 'Deselect All' : 'Select All',
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          );
        },
      ),
    );
  }
}
