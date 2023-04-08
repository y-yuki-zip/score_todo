import 'package:flutter/material.dart';
import 'todo_add.dart' ;

// ToDoリスト一覧画面
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() =>  _TodoListPageState();
}
// ToDoリスト
class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('リスト一覧'),
        ),
        body: ListView.builder(
          // リストの行数
          itemCount: todoList.length,
          // リスト
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(todoList[index])
              )
            );
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 変更を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // ToDo追加画面に遷移する
              return TodoAddPage();
            }),
          );
          // 変更を受け取れば
          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}