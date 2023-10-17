import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_master_app/Core/utils/constants.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';
import 'package:note_master_app/Feature/Home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/circle_item.dart';
import 'package:note_master_app/Feature/Home/presentation/views/widgets/custom_text_form_field.dart';

import '../../../../Core/utils/styles.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: MyColors.myOrange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextFormField(
                controller: titleController,
                hintText: 'Title',
                style:
                    Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: CustomTextFormField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 100,
                  style: Styles.textStyle16,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  itemBuilder: (context, index) => CircleItem(
                    color: kColors[index],
                  ),
                  itemCount: kColors.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                        backgroundColor: MyColors.myWhite,
                      ),
                      onPressed: () {
                        NoteModel noteModel = NoteModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          color: kColors[0].value,
                          date:
                              DateFormat("d MMM yyyy").format(DateTime.now()),
                        );

                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                      },
                      child: Text(
                        'Add Note',
                        style: Styles.textStyle14.copyWith(
                            color: MyColors.myOrange,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
