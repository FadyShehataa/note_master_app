import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_master_app/Core/utils/constants.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';
import 'package:note_master_app/Core/utils/styles.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/views/add_note.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/note_item.dart';

import '../../../../Core/utils/icon_broken.dart';
import '../../data/models/note_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
                      print(
                          'length = ${notesBox.values.toList().length}');
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
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => const NoteItem(
                    title: 'title',
                    description:
                        'Ut officia esse aliqua cupidatat culpa. Reprehenderit velit occaecat tempor officia aliquip sit. Id dolore pariatur ipsum id ipsum tempor consequat eiusmod Lorem adipisicing. Culpa eiusmod aute commodo nulla incididunt excepteur. Culpa commodo veniam magna sit deserunt fugiat cupidatat quis ad irure qui proident.',
                    color: MyColors.myOrange,
                  ),
                  itemCount: 10,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                ),
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
