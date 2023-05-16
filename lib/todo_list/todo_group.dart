import 'package:flutter/material.dart';
import 'package:score_todo/todo_list/todo_list.dart';

/// Todoリスト一覧画面をまとめたクラス
class TodoGroup extends StatefulWidget {
  /// コンストラクタ
  const TodoGroup({Key? key}) : super(key: key);

  /// State作成
  @override
  TodoGroupState createState() => TodoGroupState();
}

/// Todoリスト一覧画面の状態
class TodoGroupState extends State<TodoGroup> {
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
        child: Text('その他'),
      ),
    ),
    Tab(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Text('List'),
      ),
    ),
    Tab(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Text('果物リスト'),
      ),
    ),
    Tab(
        child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            child: Icon(Icons.add_circle)))
  ];

  // タブのボディ
  static const List<Widget> tabBodies = [
    TodoListPage(),
    TodoListPage(),
    TodoListPage(),
    TodoListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
              title: const Text('ToDo'),
              bottom: const PreferredSize(
                  // タイトルとの余白を調整できる
                  preferredSize: Size.fromHeight(20),
                  // タブバー
                  child: TabBar(
                    isScrollable: true,
                    tabs: tabs,
                  ))),
          body: const TabBarView(
            children: tabBodies,
          ),
        ),
      ),
    );
  }
}
