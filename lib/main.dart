import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/todo_cubit.dart';
import 'pages/favorite_page.dart';
import 'pages/home_page.dart';
import 'pages/new_todo_page.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => TodoCubit(),
          child: Builder(builder: (context) {
            // Need Navigator to push new page and keep the BottomNavigationBar
            Widget homeWidget = Navigator(
              onGenerateRoute: (settings) {
                Widget page = const HomePage();
                if (settings.name == '/new-todo') {
                  page = NewTodoPage(
                    onAddItem: (title) {
                      BlocProvider.of<TodoCubit>(context).addItem(title);
                    },
                  );
                }

                //Fade Anination
                return PageRouteBuilder(
                  settings: settings,
                  pageBuilder: (_, __, ___) => page,
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c),
                );
              },
            );

            switch (_selectedIndex) {
              case 0:
                return homeWidget;
              case 1:
                return const FavoritePage();
              default:
                return homeWidget;
            }
          })),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
