import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/styles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.title,
    required this.description,
    this.color,
  });

  final String title;
  final String description;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          title: Text(
            title,
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                description,
                style: Styles.textStyle14,
              ),
              const SizedBox(height: 16),
              Text(
                "Created at ${DateFormat("d MMM yyyy").format(DateTime.now())}",
                style: Styles.textStyle11,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
