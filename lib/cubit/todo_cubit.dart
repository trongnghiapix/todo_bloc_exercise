import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_item.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodosState> {
  TodoCubit() : super(TodosState());

  //add item
  void addItem(String title) {
    final currentState = state;
    TodoItem newItem = TodoItem(
      title: title,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );
    emit(TodosState(todos: [...currentState.todos, newItem]));
  }

  //change favorite
  void changeFavorite(TodoItem itemToChange) {
    final List<TodoItem> currentTodos = state.todos;
    int index = currentTodos.indexOf(itemToChange);
    final TodoItem item = currentTodos.elementAt(index);

    final TodoItem newItem = TodoItem(
      title: item.title,
      isFavorite: !item.isFavorite,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
    );

    final List<TodoItem> newTodos = [
      ...currentTodos.sublist(0, index),
      newItem,
      ...currentTodos.sublist(index + 1),
    ];

    emit(TodosState(todos: newTodos));
  }
}
