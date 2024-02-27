import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_event.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = 'setting';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late StreamSubscription<ImageEvent> _imageEventstreamSubscription;

  @override
  void initState() {
    super.initState();
    _imageEventstreamSubscription =
        context.read<AppImageProvider>().imageEventStream.listen((event) {
      event.whenOrNull(
        onImageDeleteSuccess: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                'Image delete success',
              )),
        ),
        onImageDeleteFailure: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(e.toString()),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _imageEventstreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Selector<AppImageProvider, bool>(
              selector: (_, provider) => provider.state.loading,
              builder: (context, loading, child) {
                if (loading) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton.icon(
                    onPressed: () =>
                        context.read<AppImageProvider>().deleteAllImages(),
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete All Images'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
