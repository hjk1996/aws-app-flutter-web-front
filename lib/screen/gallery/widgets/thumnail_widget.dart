import 'package:flutter/material.dart';
import 'package:flutter_web/model/state_model/image_item.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:provider/provider.dart';

class ThumnailWidget extends StatefulWidget {
  const ThumnailWidget(
      {super.key, required this.index, required this.imageItem});

  final int index;
  final ImageItem imageItem;

  @override
  State<ThumnailWidget> createState() => _ThumnailWidgetState();
}

class _ThumnailWidgetState extends State<ThumnailWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Selector<AppImageProvider, bool>(
      selector: (_, provider) => provider.state.selectedMode,
      builder: (context, selectMode, child) {
        if (selectMode) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _selected = !_selected;
                });
                context
                    .read<AppImageProvider>()
                    .toggleImageItemSelection(widget.index);
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selected ? Colors.blue : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Image.memory(
                      widget.imageItem.imageData.thumbnail!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (_selected)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ));
        } else {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selected ? Colors.blue : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Image.memory(
                widget.imageItem.imageData.thumbnail!,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      },
    );
  }
}
