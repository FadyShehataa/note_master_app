import 'package:flutter/material.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';

import '../../../../../Core/utils/constants.dart';
import 'circle_item.dart';

class EditNoteColorsWidget extends StatefulWidget {
  const EditNoteColorsWidget({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteColorsWidget> createState() => _EditNoteColorsWidgetState();
}

class _EditNoteColorsWidgetState extends State<EditNoteColorsWidget> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = kColors.indexOf(Color(widget.noteModel.color));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            widget.noteModel.color = kColors[index].value;
            setState(() => currentIndex = index);
          },
          child: ColorItem(
            color: kColors[index],
            isSelected: currentIndex == index,
          ),
        ),
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
