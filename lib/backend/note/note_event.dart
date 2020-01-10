import 'package:equatable/equatable.dart';
import 'package:noteme/models/note.dart';
import 'package:noteme/models/task.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class LoadNotes extends NoteEvent {}

class SaveNotes extends NoteEvent {
  final Note note;

  const SaveNotes(this.note);

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'SaveNotes { todo: $note }';
}

class UpdateNote extends NoteEvent {
  final Note updatedNote;

  const UpdateNote(this.updatedNote);

  @override
  List<Object> get props => [updatedNote];

  @override
  String toString() => 'UpdateNote { UpdateNote: $updatedNote }';
}

class DeleteNote extends NoteEvent {
  final Note note;

  const DeleteNote(this.note);

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'DeleteNote { todo: $note }';
}

class ClearCompleted extends NoteEvent {}
