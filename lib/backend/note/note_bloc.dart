import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:noteme/data/database.dart';
import './bloc.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  DatabaseHelper databaseHelper;
  @override
  NoteState get initialState => NotesLoading();

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is LoadNotes) {
      databaseHelper.getTaskList();
    }
    if (event is SaveNotes) {
      databaseHelper.saveNote(event.note);
    }
    if (event is UpdateNote) {
      databaseHelper.updateNote(event.updatedNote);
    }
    if (event is DeleteNote) {
      databaseHelper.deleteNote(event.note);
    }
  }
  
}
