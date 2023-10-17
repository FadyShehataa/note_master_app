import 'package:flutter/material.dart';
import 'package:note_master_app/Core/utils/constants.dart';

import '../../../../../Core/utils/my_colors.dart';
import '../../../../../Core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
    this.style,
  });

  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(
            color: MyColors.myWhite,
            width: 2,
          ),
        ),
        hintStyle: Styles.textStyle16,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(
            color: MyColors.myWhite,
            width: 1,
          ),
        ),
      ),
      style: style,
      cursorColor: MyColors.myWhite,
    );
  }
}
