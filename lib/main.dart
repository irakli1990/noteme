import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteme/backend/note/bloc.dart';
import 'package:noteme/backend/task/bloc.dart';
import 'backend/simple_bloc_delegate.dart';
import 'backend/tab/tab_bloc.dart';
import 'frontend/home_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider(
      create: (context) {
        return TaskBloc()..add(LoadTasks());
      },
      child: NoteMeApp(),
    ),
  );
}

class NoteMeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Note Me',
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TabBloc>(
              create: (context) => TabBloc(),
            ),
            BlocProvider<NoteBloc>(
              create: (context) => NoteBloc(),
            ),
            BlocProvider<TaskBloc>(
              create: (context) => TaskBloc(),
            ),
          ],
          child: HomeScreen(),
        ));
  }
}
