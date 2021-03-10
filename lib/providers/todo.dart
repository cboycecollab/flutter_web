import 'package:hooks_riverpod/hooks_riverpod.dart';

class Todo {
  final String? name;
  final String? description;
  final bool? completed;
  final DateTime? dueDate;

  Todo({this.completed, this.description, this.dueDate, this.name});
}

class TodoListState extends StateNotifier<List<Todo>> {
  TodoListState(List<Todo>? initial) : super(initial ?? []);

  void addTodo(Todo newTodo) {
    state = [...state, newTodo];
    print(state.length);
  }

  int get toDoCount => state.length;

  void removeTodo(String name) {
    state.removeWhere((element) => element.name == name);
  }
}

final toDoListProvider = StateNotifierProvider<TodoListState>((ref) {
  return TodoListState(null);
});
