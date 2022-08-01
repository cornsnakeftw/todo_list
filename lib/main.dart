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
      theme: ThemeData.dark(),
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
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.pinkAccent, width: 5.0),
                  ),
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
                        fontWeight: FontWeight.bold, color: Colors.pink[400]),
                  ),
                  subtitle: Text(
                    todoList[index].description ?? 'empty',
                    style: TextStyle(color: Colors.pinkAccent[100]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[400],
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
