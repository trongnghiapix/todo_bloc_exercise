import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/todo_cubit.dart';
import '../models/todo_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoCubit, TodosState>(
        builder: (context, state) {
          final List<TodoItem> todos = state.favoriteTodos;

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
    );
  }
}
