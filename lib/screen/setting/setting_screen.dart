import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/image_event.dart';
import 'package:flutter_web/event/setting_event.dart';
import 'package:flutter_web/providers/app_image_provider.dart';
import 'package:flutter_web/providers/face_search_provider.dart';
import 'package:flutter_web/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = 'setting';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late StreamSubscription<SettingEvent> _imageEventstreamSubscription;

  @override
  void initState() {
    super.initState();
    _imageEventstreamSubscription =
        context.read<SettingProvider>().eventStream.listen((event) {
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
        onFaceIndexResetFailure: (e) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(e.toString()),
          ),
        ),
        onFaceIndexResetSuccess: () =>
            ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Face index reset success',
            ),
          ),
        ),
        onImageCaptionResetFailure: (e) =>
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(e.toString()),
          ),
        ),
        onImageCaptionResetSuccess: () =>
            ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Image caption reset success',
            ),
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
      )),
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
            const SizedBox(height: 20),
            Selector<SettingProvider, bool>(
              selector: (_, provider) => provider.state.loading,
              builder: (context, loading, child) {
                if (loading) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton.icon(
                    onPressed: () async =>
                        await context.read<SettingProvider>().resetFaceIndex(),
                    icon: const Icon(Icons.face),
                    label: const Text('Delete Face Index'));
              },
            ),
            const SizedBox(height: 20),
            Selector<SettingProvider, bool>(
              selector: (_, provider) => provider.state.loading,
              builder: (context, loading, child) {
                if (loading) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton.icon(
                    onPressed: () async => await context
                        .read<SettingProvider>()
                        .deleteAllImageCaptions(),
                    icon: const Icon(Icons.analytics),
                    label: const Text('Delete Image Captions'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
