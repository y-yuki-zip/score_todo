import 'package:flutter/material.dart';

void main() {
  // エントリポイント
  runApp(const MyApp());
}

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


// リスト追加
class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}
// リスト追加の状態
class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加')
      ),

      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // テキスト入力
            TextField( 
              // データ入力を受け取る
              onChanged: (String value) {
                // 入力に合わせて画面更新 
                setState(() {
                  _text = value;
                });
              },
            ),
            // 余白
            const SizedBox(height: 8),
            // ボタン
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  // _textのデータを渡す
                  Navigator.of(context).pop(_text);
                },
                child: const Text('リスト追加', style: TextStyle(color: Colors.white))
              ),
            ),
            // 余白
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: (){
                  // _textのデータを渡す
                  Navigator.of(context).pop();
                },
                child: const Text('キャンセル'),
                )
            )
          ],
        )
      ),
    );
  }

}


