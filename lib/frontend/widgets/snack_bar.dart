import 'package:flutter/material.dart';
import 'package:noteme/models/task.dart';


class DeleteTaskSnackBar extends SnackBar {

  DeleteTaskSnackBar({
    Key key,
    @required Task task,
    @required VoidCallback onUndo,
  }) : super(
    key: key,
    content: Text(
      task.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: 'undo',
      onPressed: onUndo,
    ),
  );
}
