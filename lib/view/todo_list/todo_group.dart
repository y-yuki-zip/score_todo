import 'package:flutter/material.dart';
import 'todo_list.dart';

/// Todoリストのタブ
class TodoGroup extends StatefulWidget {
  const TodoGroup({Key? key}) : super(key: key);

  // タブのヘッダー
  static const List<Widget> tabs = [
    Tab(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Text('買い物リスト'),
      ),
    ),
    Tab(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Text('買い物リスト'),
      ),
    ),
    Tab(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Text('買い物リスト'),
      ),
    ),
    Tab(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Text('買い物リスト'),
      ),
    ),
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
            title: const Text('ToDo'),
            bottom: const PreferredSize(
              // タイトルとの余白を調整できる
              preferredSize: Size.fromHeight(20),
              // タブバー
              child: TabBar(
                isScrollable: true,
                tabs: TodoGroup.tabs,
              )
            )
          ),
          body: const TabBarView(
            children: TodoGroup.tabBodies,
          ),
        ),
      ),
    );
  }
}
