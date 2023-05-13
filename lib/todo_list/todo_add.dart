import 'package:flutter/material.dart';

// リスト追加
class TodoAddPage extends StatefulWidget {
  // コンストラクタ
  const TodoAddPage({super.key});

  @override
  TodoAddPageState createState() => TodoAddPageState();
}


// リスト追加の状態
class TodoAddPageState extends State<TodoAddPage> {
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
            SizedBox(
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
            SizedBox(
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