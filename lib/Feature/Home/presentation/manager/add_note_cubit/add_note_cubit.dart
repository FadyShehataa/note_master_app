import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_master_app/Core/utils/constants.dart';
import 'package:note_master_app/Feature/Home/data/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color colorNote = kColors[0];

  addNote(NoteModel noteModel) async {
    noteModel.color = colorNote.value;
    emit(AddNoteLoading());
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure(message: e.toString()));
    }
    colorNote = kColors[0];
  }
}
