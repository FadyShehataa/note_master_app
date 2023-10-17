import 'package:flutter/material.dart';

import '../my_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customShowSnackBar(
    BuildContext context, String errorMessage) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: MyColors.myRed,
    ),
  );
}
