import 'package:equatable/equatable.dart';
import 'package:noteme/models/note.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NotesLoading extends NoteState {}

class NotesLoaded extends NoteState {
  final List<Note> notes;

  const NotesLoaded([this.notes = const []]);

  @override
  List<Object> get props => [notes];

  @override
  String toString() => 'NotesLoaded { notes: $notes }';
}

class TasksNotLoaded extends NoteState {
  @override
  String toString() {
    return 'TasksNotLoaded{}';
  }
}
