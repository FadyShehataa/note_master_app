import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../Core/utils/my_colors.dart';

import '../../../../../Core/utils/assets_data.dart';
import '../../../../../Core/utils/styles.dart';

class EmptyNotesWidget extends StatelessWidget {
  const EmptyNotesWidget({super.key, this.title, this.subtitle});

  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsData.emptyNotes,
          height: 200,
          semanticsLabel: 'Empty Notes',
          colorFilter:
              const ColorFilter.mode(MyColors.myOrange, BlendMode.srcIn),
        ),
        const SizedBox(height: 20),
        if (title != null)
          Text(
            title!,
            style: Styles.textStyle20,
          ),
        const SizedBox(height: 10),
        if (subtitle != null)
          Text(
            subtitle!,
            style: Styles.textStyle16,
          ),
      ],
    );
  }
}
