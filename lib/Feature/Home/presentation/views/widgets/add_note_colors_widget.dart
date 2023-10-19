import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/constants.dart';
import '../../manager/add_note_cubit/add_note_cubit.dart';
import 'circle_item.dart';

class AddNoteColorsWidget extends StatefulWidget {
  const AddNoteColorsWidget({super.key});

  @override
  State<AddNoteColorsWidget> createState() => _AddNoteColorsWidgetState();
}

class _AddNoteColorsWidgetState extends State<AddNoteColorsWidget> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex =
        kColors.indexOf(BlocProvider.of<AddNoteCubit>(context).colorNote);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            BlocProvider.of<AddNoteCubit>(context).colorNote = kColors[index];
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
