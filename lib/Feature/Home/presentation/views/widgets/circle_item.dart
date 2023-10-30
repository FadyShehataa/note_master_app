import 'package:flutter/material.dart';
import '../../../../../Core/utils/my_colors.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, this.color, required this.isSelected});
  final Color? color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 25,
            backgroundColor: MyColors.myWhite,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 25,
            backgroundColor: color,
          );
  }
}
