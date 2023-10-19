import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_master_app/Core/utils/icon_broken.dart';
import 'package:note_master_app/Core/utils/styles.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';

import '../manager/get_notes_cubit/get_notes_cubit.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(IconBroken.Arrow___Left_2),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO : navigate to edit screen
            },
            icon: const Icon(IconBroken.Edit),
          ),
          IconButton(
            onPressed: () {
              noteModel.delete();
              BlocProvider.of<GetNotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            icon: const Icon(IconBroken.Delete),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                noteModel.title,
                style: Styles.textStyle26,
              ),
              const SizedBox(height: 24),
              Text(
                noteModel.description,
                style: Styles.textStyle16,
              ),
              const Spacer(),
              Text(
                'Created at ${noteModel.date}',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
