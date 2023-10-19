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
    this.validator,
  });

  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  final TextStyle? style;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(
            color: MyColors.myRed,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(
            color: MyColors.myRed,
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
      validator: validator,
    );
  }
}
