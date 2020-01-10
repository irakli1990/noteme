import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:noteme/backend/tab/tab_event.dart';
import 'package:noteme/models/tab.dart';


class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.task;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
