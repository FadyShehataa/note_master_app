import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_master_app/Core/utils/constants.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';
import 'package:note_master_app/Core/utils/styles.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/get_notes_cubit/get_notes_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/views/add_note.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/note_item.dart';

import '../../../../Core/utils/icon_broken.dart';
import '../../data/models/note_model.dart';

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

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Note Master',
                    style: Styles.textStyle36,
                  ),
                  IconButton(
                    onPressed: () {
                      themeCubit.changeTheme();
                      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
                      print('length = ${notesBox.values.toList().length}');
                    },
                    icon: themeCubit.isDark
                        ? const Icon(Icons.light_mode, size: 28)
                        : const Icon(Icons.dark_mode, size: 28),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search note',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(IconBroken.Search, size: 28),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<GetNotesCubit, GetNotesState>(
                builder: (context, state) {
                  List<NoteModel> notes =
                      BlocProvider.of<GetNotesCubit>(context).notes ?? [];
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => NoteItem(
                        noteModel: notes[index],
                      ),
                      itemCount: notes.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.myPink,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddNote()),
          );
        },
        child: const Icon(
          Icons.add,
          size: 24,
        ),
      ),
    );
  }
}
