import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_master_app/Core/utils/constants.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/theme_cubit/theme_cubit.dart';

import 'Feature/Home/presentation/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(
    DevicePreview(
      builder: (context) => BlocProvider(
        create: (_) => ThemeCubit(),
        child: const NoteMasterApp(),
      ),
    ),
  );
}

class NoteMasterApp extends StatelessWidget {
  const NoteMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: MaterialApp(
        theme: themeCubit.isDark ? ThemeData.dark() : ThemeData.light(),
        builder: DevicePreview.appBuilder,
        home: const HomeView(),
      ),
    );
  }
}
