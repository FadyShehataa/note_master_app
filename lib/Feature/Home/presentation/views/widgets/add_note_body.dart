import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import 'custom_text_form_field.dart';
import 'note_colors_widget.dart';

class AddNoteBody extends StatelessWidget {
  const AddNoteBody({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: titleController,
          hintText: 'Title',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Title is required';
            } else if (value.length > 20) {
              return 'Title is too long';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(height: 20),
        Expanded(
          child: CustomTextFormField(
            controller: descriptionController,
            hintText: 'Description',
            maxLines: 100,
            style: Styles.textStyle16,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Description is required';
              } else {
                return null;
              }
            },
          ),
        ),
        const SizedBox(height: 20),
        const NoteColorsWidget(),
      ],
    );
  }
}
