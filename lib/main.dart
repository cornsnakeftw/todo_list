// import 'package:flutter/material.dart';

// void main() => runApp(App());

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.dark(),
//       home: TodoList(),
//     );
//   }
// }

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   final List<String> _todoList = <String>[];
//   final TextEditingController _textFieldController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('To-Do List')),
//       body: ListView(children: _getItems()),
//       floatingActionButton: FloatingActionButton(
//           onPressed: () => _addTodoItem(title),
//           tooltip: 'Add Item',
//           child: Icon(Icons.add)),
//     );
//   }

//   void _addTodoItem(String title) {
//     setState(() {
//       _todoList.add(title);
//     });
//     _textFieldController.clear();
//   }
// }

// class MyCustomForm extends StatelessWidget {
//   const MyCustomForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'Title',
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextFormField(
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Description',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'TO-DO List'),
    );
  }
}

class Todo {
  String? title;
  String? description;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textDescriptionController = TextEditingController();
  final _textTitleController = TextEditingController();
  final List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
// mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
// color: Colors.red,
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _textTitleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              )),
          Container(
// color: Colors.red,
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _textDescriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(),
                ),
              )),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    todoList[index].title ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  subtitle: Text(
                    todoList[index].description ?? 'empty',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Todo todo_Item = Todo();
          todo_Item.title = _textTitleController.text;
          todo_Item.description = _textDescriptionController.text;
          setState(() {
            todoList.add(todo_Item);
          });
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
