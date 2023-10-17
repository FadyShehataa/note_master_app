import 'package:flutter/material.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';
import 'package:note_master_app/Feature/Home/presentation/views/add_note.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/note_item.dart';

import '../../../../Core/utils/icon_broken.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'NoteMaster',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search note',
                  hintMaxLines: 1,
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
                  // fillColor: Colors.mySteelBlue.withOpacity(0.2),
                  filled: true,
                  // hintStyle: Styles.textStyle18,
                ),
                // style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => const NoteItem(
                    title: 'title',
                    description:
                        'description description description description description description description description description description description description description description description description description description ',
                    color: MyColors.myOrange,
                  ),
                  itemCount: 10,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
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
          size: 32,
        ),
      ),
    );
  }
}
