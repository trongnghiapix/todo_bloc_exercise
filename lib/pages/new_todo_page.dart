import 'package:flutter/material.dart';

class NewTodoPage extends StatefulWidget {
  const NewTodoPage({super.key, required this.onAddItem});

  final Function(String) onAddItem;

  @override
  State<NewTodoPage> createState() => _NewTodoPageState();
}

class _NewTodoPageState extends State<NewTodoPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Title'),
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: _controller.text.isEmpty
                      ? null
                      : () {
                          widget.onAddItem.call(_controller.text);
                          Navigator.pop(context);
                        },
                  child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
