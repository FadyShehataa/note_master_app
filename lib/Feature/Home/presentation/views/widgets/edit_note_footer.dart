import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/my_colors.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../data/models/note_model.dart';
import '../../manager/add_note_cubit/add_note_cubit.dart';
import '../../manager/get_notes_cubit/get_notes_cubit.dart';
import 'edit_note_colors_widget.dart';

class EditNoteFooter extends StatelessWidget {
  const EditNoteFooter({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.formKey,
    required this.noteModel,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditNoteColorsWidget(noteModel: noteModel),
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
                  if (formKey.currentState!.validate()) {
                    noteModel.title = titleController.text;
                    noteModel.description = descriptionController.text;
                    noteModel.save();
                    BlocProvider.of<GetNotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Edit Note',
                  style: Styles.textStyle14.copyWith(
                      color: BlocProvider.of<AddNoteCubit>(context).editColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
