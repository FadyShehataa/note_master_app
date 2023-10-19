import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/views/add_note_view.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/custom_search_note.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetNotesCubit>(context).fetchAllNotes();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              HomeViewAppBar(themeCubit: themeCubit),
              const SizedBox(height: 10),
              CustomSearchNote(searchController: searchController),
              const SizedBox(height: 10),
              const HomeViewBody(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.myOrange,
        onPressed: () {
          searchController.clear();
          BlocProvider.of<GetNotesCubit>(context).searchNotes('');
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddNoteView()),
          );
        },
        child: const Icon(Icons.add, size: 24),
      ),
    );
  }
}
