import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import '../../manager/theme_cubit/theme_cubit.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
    required this.themeCubit,
  });

  final ThemeCubit themeCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Note Master', style: Styles.textStyle36),
        IconButton(
          onPressed: () => themeCubit.changeTheme(),
          icon: themeCubit.isDark
              ? const Icon(Icons.light_mode, size: 28)
              : const Icon(Icons.dark_mode, size: 28),
        ),
      ],
    );
  }
}
