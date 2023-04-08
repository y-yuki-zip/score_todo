import 'package:flutter/material.dart';
import 'todo_add.dart' ;

// ToDoリスト一覧画面
class TodoListPage extends StatefulWidget {
  // コンストラクタ
  const TodoListPage({super.key});

  // createStateのオーバーライド
  @override
  TodoListPageState createState() =>  TodoListPageState();
}


// ToDoリスト
class TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: ListView.builder(
          // リストの行数
          itemCount: todoList.length,
          // リスト
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(todoList[index]),
                leading: Icon(Icons.circle_outlined),
                trailing: Icon(Icons.edit),
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
              return const TodoAddPage();
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

  // ToDoリストアイテムを作成する
  Widget _buildTodoItem(String item, int index) {
    return ListTile(
      title: Text(item),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _removeTodoItem(index),
      )
    );
  }

  // Todoリストアイテムを削除する
  void _removeTodoItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  // Todoリストを作成する
  Widget _buildTodoList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildTodoItem(todoList[index], index);
      },
      itemCount: todoList.length,
    );
  }
}
