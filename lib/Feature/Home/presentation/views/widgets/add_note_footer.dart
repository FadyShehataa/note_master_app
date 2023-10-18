import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/my_colors.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../data/models/note_model.dart';
import '../../manager/add_note_cubit/add_note_cubit.dart';

class AddNoteFooter extends StatelessWidget {
  const AddNoteFooter({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.formKey,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              if (formKey.currentState!.validate()) {
                NoteModel noteModel = NoteModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  color: kColors[0].value,
                  date: DateFormat("d MMM yyyy").format(DateTime.now()),
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
              }
            },
            child: Text(
              'Add Note',
              style: Styles.textStyle14.copyWith(
                  color: MyColors.myOrange, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
