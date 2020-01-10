import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteme/backend/task/bloc.dart';
import 'package:noteme/frontend/widgets/loading_indicatior.dart';

import 'widgets/snack_bar.dart';
import 'widgets/task_item.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TasksLoading) {
          return LoadingIndicator();
        } else if (state is TasksLoaded) {
          final tasks = state.tasks;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final task = tasks[index];
              return TaskItem(
                task: task,
                onDismissed: (direction) {
                  BlocProvider.of<TaskBloc>(context).add(DeleteTask(task));
                  Scaffold.of(context).showSnackBar(DeleteTaskSnackBar(
                    task: task,
                    onUndo: () =>
                        BlocProvider.of<TaskBloc>(context).add(SaveTask(task)),
                  ));
                },
              );
            },
          );
        }
        if (state is TasksNotLoaded) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
