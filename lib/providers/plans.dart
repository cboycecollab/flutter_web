import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_app/providers/todo.dart';

class Plans extends StateNotifier<bool> {
  final int length;
  Plans(this.length) : super(length > 3 ? true : false);

  void toggle() {
    state = !state;
  }

  int get count => length;

  Widget plansResponse() {
    return state ? Text('I can go out') : Text('I cannot go out');
  }
}

final plansProvider = StateNotifierProvider<Plans>((ref) {
  final toDoList = ref.watch(toDoListProvider.state);

  return Plans(toDoList.length);
});
