import 'package:flutter/material.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';

import '../../../../../Core/utils/icon_broken.dart';

class CustomSearchNote extends StatelessWidget {
  const CustomSearchNote({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search note',
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            IconBroken.Search,
            size: 28,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
    );
  }
}
