import 'package:flutter/material.dart';
import 'package:score_todo/todo_list/todo_list.dart';
import 'package:score_todo/todo_list/todo_value_object.dart';

/// Todoリスト一覧画面をまとめたクラス
class TodoGroup extends StatefulWidget {
  /// コンストラクタ
  const TodoGroup({Key? key}) : super(key: key);

  /// State作成
  @override
  TodoGroupState createState() => TodoGroupState();
}

/// Todoリスト一覧画面の状態
class TodoGroupState extends State<TodoGroup> with TickerProviderStateMixin {
  // デフォルトタブ名
  static const _defaultTabName = '新規リスト';
  // タブコントローラー
  TabController? _tabController;
  // Todoリストのタスクを表す
  List<TodoValueObject> _tabValues = [
    TodoValueObject(_defaultTabName, 0),
    TodoValueObject(_defaultTabName, 1)
  ];

  /// Tabを追加する
  void _addTab() {
    setState(() {
      _tabValues.add(TodoValueObject(_defaultTabName, _tabValues.length));
      _tabController = _createTabController();
    });
  }

  /// Tabを削除する
  /// [priority]消す対象の順番
  void _removeTab(int priority) {
    setState(() {
      _tabValues.removeAt(priority);
      _tabController = _createTabController();
    });
  }

  /// TabControllerを作成する
  TabController _createTabController() {
    return TabController(length: _tabValues.length, vsync: this);
  }

  /// 表示する際に呼び出される
  @override
  void initState() {
    super.initState();
    _tabController = _createTabController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabValues.length,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('ToDo'),
            actions: [
              // 追加ボタン
              IconButton(
                onPressed: () {
                  _addTab();
                },
                icon: const Icon(Icons.add),
              ),
              // メニューボタン
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              )
            ],
            bottom: PreferredSize(
                // タイトルとの余白を調整できる
                preferredSize: const Size.fromHeight(20),
                // タブバー
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabs: _tabValues
                      .map((e) => Tab(
                              child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                            child: Text(e.name),
                          )))
                      .toList(),
                ))),
        body: TabBarView(
          children: _tabValues.map((e) => TodoListPage()).toList(),
        ),
      ),
    );
  }
}
