import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:noteme/data/database.dart';
import 'bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  DatabaseHelper databaseHelper;

  @override
  TaskState get initialState => TasksLoading();

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is LoadTasks) {
      databaseHelper.getTaskList();
    }
    if (event is SaveTask) {
      databaseHelper.saveTask(event.task);
    }
    if (event is UpdateTask) {
      databaseHelper.updateTask(event.updatedTask);
    }
    if (event is DeleteTask) {
      databaseHelper.deleteTask(event.task);
    }
  }
}
