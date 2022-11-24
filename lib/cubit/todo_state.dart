part of 'todo_cubit.dart';

class TodosState {
  TodosState({this.todos = const []});

  final List<TodoItem> todos;
}

extension TodoStateX on TodosState {
  // For Home Page
  List<TodoItem> get allTodos {
    return todos;
  }

  // For Favorite Page
  List<TodoItem> get favoriteTodos {
    return todos.where((element) => element.isFavorite).toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }
}
