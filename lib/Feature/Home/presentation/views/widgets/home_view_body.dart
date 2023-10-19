import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/note_model.dart';
import '../../manager/get_notes_cubit/get_notes_cubit.dart';
import 'empty_notes_widget.dart';
import 'note_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<GetNotesCubit>(context).searchedNotes;
        return Expanded(
          child: BlocProvider.of<GetNotesCubit>(context).notes.isNotEmpty
              ? notes.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) => NoteItem(
                        noteModel: notes[index],
                      ),
                      itemCount: notes.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                    )
                  : const EmptyNotesWidget(title: 'No Results Found')
              : const EmptyNotesWidget(
                  title: 'You don\'t have any notes yet ',
                  subtitle: 'Add a new note to get started',
                ),
        );
      },
    );
  }
}
