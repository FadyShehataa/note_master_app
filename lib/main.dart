import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_master_app/Core/utils/constants.dart';
import 'package:note_master_app/Core/utils/styles.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:note_master_app/simple_bloc_observer.dart';
import 'package:page_transition/page_transition.dart';

import 'Feature/Home/presentation/views/home_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider(
          create: (context) => GetNotesCubit(),
        ),
      ],
      child: MaterialApp(
        theme: themeCubit.isDark ? ThemeData.dark() : ThemeData.light(),
        builder: DevicePreview.appBuilder,
        home: AnimatedSplashScreen(
          splash: Text('Note Master', style: Styles.textStyle48),
          nextScreen: const HomeView(),
          splashTransition: SplashTransition.scaleTransition,
          duration: 2000,
          curve: Curves.easeOut,
          animationDuration: const Duration(milliseconds: 1500),
          pageTransitionType: PageTransitionType.rightToLeftWithFade,
        ),
      ),
    );
  }
}
