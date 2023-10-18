import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';

import '../../../../../Core/utils/constants.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());

  List<NoteModel> notes = [];
  List<NoteModel> searchedNotes = [];

  fetchAllNotes() {
    emit(GetNotesLoading());
    Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    searchedNotes = notes;
    emit(GetNotesSuccess());
  }

  searchNotes(String query) {
    emit(GetNotesLoading());
    searchedNotes = notes
        .where((note) => note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(GetNotesSuccess());
  }
}
