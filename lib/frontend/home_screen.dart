import 'package:flutter/material.dart';
import 'package:noteme/backend/tab/tab_bloc.dart';
import 'package:noteme/backend/tab/tab_event.dart';
import 'package:noteme/frontend/note_screen.dart';
import 'package:noteme/frontend/task_screen.dart';
import 'package:noteme/frontend/widgets/tab_selector.dart';
import 'package:noteme/models/tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Note ME'),
          ),
          body: activeTab == AppTab.task ? TaskScreen() : NoteScreen(),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
