import 'package:flutter/material.dart';
import 'todo_list.dart';

/// Todoリストのタブ
class TodoGroup extends StatefulWidget {
  const TodoGroup({Key? key}) : super(key: key);

  static const List<Widget> tabs = [
    Icon(Icons.directions_car),
    Icon(Icons.directions_bus),
    Icon(Icons.directions_bike),
  ];

  static const List<Widget> tabBodys = [
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
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: TodoGroup.tabs,
            ),
            title: const Text('ToDo'),
          ),
          body: const TabBarView(
            children: TodoGroup.tabBodys,
          ),
        ),
      ),
    );
  }
}
