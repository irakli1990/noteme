import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  @override
  NoteState get initialState => InitialNoteState();

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
