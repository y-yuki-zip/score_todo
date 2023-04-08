import 'package:flutter/material.dart';
import 'todo_list.dart';

/// Todoリストのタブ
class TodoGroup extends StatefulWidget {
  const TodoGroup({Key? key}) : super(key: key);

  // タブのヘッダー
  static const List<Widget> tabs = [
    Text('買い物リスト'),
    Text('今日やること'),
    Text('明日タスク１'),
    Text('明後日タスク２'),
  ];

  // タブのボディ
  static const List<Widget> tabBodies = [
    TodoListPage(),
    TodoListPage(),
    TodoListPage(),
    TodoListPage(),
  ];

  @override
  TodoGroupState createState() => TodoGroupState();
}


/// Todoリストのタブの状態
class TodoGroupState extends State<TodoGroup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: TodoGroup.tabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              isScrollable: true,            
              tabs: TodoGroup.tabs,
            ),
            title: const Text('ToDo'),
          ),
          body: const TabBarView(
            children: TodoGroup.tabBodies,
          ),
        ),
      ),
    );
  }
}
