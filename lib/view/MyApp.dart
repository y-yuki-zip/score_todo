import 'package:flutter/material.dart';
import 'todo_list/todo_list.dart' ;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'Score ToDo List',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // リスト一覧
      home: TodoListPage(),
    );
  }
}