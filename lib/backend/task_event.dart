import 'package:equatable/equatable.dart';
import 'package:noteme/models/task.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {}

class SaveTask extends TaskEvent {
  final Task task;

  const SaveTask(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'SaveTask { todo: $task }';
}

class UpdateTask extends TaskEvent {
  final Task updatedTask;

  const UpdateTask(this.updatedTask);

  @override
  List<Object> get props => [updatedTask];

  @override
  String toString() => 'UpdateTask { updatedTask: $updatedTask }';
}

class DeleteTask extends TaskEvent {
  final Task task;

  const DeleteTask(this.task);

  @override
  List<Object> get props => [task];

  @override
  String toString() => 'DeleteTodo { todo: $task }';
}

class ClearCompleted extends TaskEvent {}
