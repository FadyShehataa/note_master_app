import 'package:flutter/material.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';

import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/styles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Dismissible( // TODO: refactor this widget to a separate file
      key: const Key('noteModel.id.toString()'),
      direction: DismissDirection.endToStart,
      background: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        color: MyColors.myRed,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              children: [
                const Spacer(),
                Text('Delete', style: Styles.textStyle20),
                const Spacer(),
                const Icon(
                  Icons.delete,
                  color: MyColors.myWhite,
                  size: 32,
                ),
              ],
            ),
          ),
        ),
      ),
      onDismissed: (_) => noteModel.delete(),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        color: Color(noteModel.color),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            title: Text(
              noteModel.title,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(noteModel.description, style: Styles.textStyle14),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Created at ${noteModel.date}",
                    style: Styles.textStyle11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
