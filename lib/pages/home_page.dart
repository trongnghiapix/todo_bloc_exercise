import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/todo_cubit.dart';
import '../models/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoCubit, TodosState>(
        builder: (context, state) {
          final List<TodoItem> todos = state.allTodos;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              TodoItem item = todos.elementAt(index);
              return ListTile(
                title: Text(item.title),
                leading: Icon(
                  todos.elementAt(index).isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                onTap: () {
                  context.read<TodoCubit>().changeFavorite(item);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/new-todo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
