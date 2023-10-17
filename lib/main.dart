import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'Feature/Home/presentation/views/home_view.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const NoteMasterApp(),
    ),
  );
}

class NoteMasterApp extends StatelessWidget {
  const NoteMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      builder: DevicePreview.appBuilder,
      home: HomeView(),
    );
  }
}
