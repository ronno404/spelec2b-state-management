import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todo_provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _HomePageState();
}

class _HomePageState extends State<TodoPage> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Todo List"),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                TextField(
                    controller: textFieldController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Input something to do...",
                    )),
                const SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      if (textFieldController.text.isEmpty) {
                        return;
                      }
                      Provider.of<TodoProvider>(context, listen: false)
                          .add(Todo(title: textFieldController.text));
                      textFieldController.text = '';
                    },
                    child: const Text('Add Todo')),
                const SizedBox(height: 20.0),
                Expanded(
                  child: SizedBox(
                      height: 300.0,
                      child: Consumer<TodoProvider>(
                          builder: (context, provider, child) {
                        return ListView.builder(
                          itemCount: provider.items.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: ListTile(
                              leading: const FlutterLogo(),
                              trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    Provider.of<TodoProvider>(context,
                                            listen: false)
                                        .remove(item: provider.items[index]);
                                  }),
                              title: Text(provider.items[index].getTitle),
                            ));
                          },
                        );
                      })),
                ),
              ],
            )));
  }
}
