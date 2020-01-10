import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noteme/models/task.dart';


class TaskItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Task task;

  TaskItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${task.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              task.name,
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        subtitle: task.addTime.isNotEmpty
            ? Text(
          task.addTime,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subhead,
        )
            : null,
      ),
    );
  }
}
