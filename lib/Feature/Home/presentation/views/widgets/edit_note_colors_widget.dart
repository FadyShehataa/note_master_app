import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';

import '../../../../../Core/utils/constants.dart';
import '../../manager/add_note_cubit/add_note_cubit.dart';
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

    for (int i = 0; i < kColors.length; i++) {
      if (BlocProvider.of<AddNoteCubit>(context).editColor.value ==
          kColors[i].value) {
        currentIndex = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            widget.noteModel.color = kColors[index].value;
            BlocProvider.of<AddNoteCubit>(context).editColor = kColors[index];
            BlocProvider.of<AddNoteCubit>(context).changeColor();
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
