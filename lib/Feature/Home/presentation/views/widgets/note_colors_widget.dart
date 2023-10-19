import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/constants.dart';
import '../../manager/add_note_cubit/add_note_cubit.dart';
import 'circle_item.dart';

class NoteColorsWidget extends StatefulWidget {
  const NoteColorsWidget({super.key});

  @override
  State<NoteColorsWidget> createState() => _NoteColorsWidgetState();
}

class _NoteColorsWidgetState extends State<NoteColorsWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            BlocProvider.of<AddNoteCubit>(context).colorNote = kColors[index];
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
