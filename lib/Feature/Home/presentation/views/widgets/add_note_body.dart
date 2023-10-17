import 'package:flutter/material.dart';

import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/styles.dart';
import 'circle_item.dart';
import 'custom_text_form_field.dart';

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
            itemBuilder: (context, index) => ColorItem(color: kColors[index]),
            itemCount: kColors.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),
      ],
    );
  }
}
