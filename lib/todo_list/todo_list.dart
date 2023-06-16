import 'package:flutter/material.dart';
import 'package:score_todo/todo_list/todo_repository.dart';
import 'package:score_todo/todo_list/task_value_object.dart';

/// ToDoリスト
class TodoListPage extends StatefulWidget {
  // コンストラクタ
  const TodoListPage({super.key});

  // createStateのオーバーライド
  @override
  TodoListPageState createState() => TodoListPageState();
}

/// ToDoリストの状態を保持するクラス
class TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ
  List<TaskValueObject> taskList = [];

  // Todo件名を一時的に格納する
  String taskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          // リストの行数
          itemCount: taskList.length,
          // リスト
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                    title: Text(taskList[index].name),
                    leading: const Icon(Icons.circle_outlined),
                    trailing: TextButton(
                      onPressed: () async {
                        // とりあえず削除
                        var rep = TodoRepository();
                        var db = await rep.createConnection();
                        print(await rep.deleteTodoList(db, index));
                        print(await rep.getTodoList(db));

                        setState(() {
                          taskList.removeAt(index);
                        });
                      },
                      child: const Icon(Icons.delete),
                    )));
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // 変更を受け取る
            final newTitleText = await showModalBottomSheet<String>(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  // モーダルの背景作成
                  return Padding(
                      // キーボードによってスクロールを可能にする
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),

                      // 入力画面本体
                      child: SizedBox(
                        height: 100,
                        // モーダルの中身作成
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // 入力項目
                            TextField(
                              decoration:
                                  const InputDecoration(hintText: '新しいタスク'),
                              autofocus: true,
                              onChanged: (value) {
                                taskTitle = value;
                              },
                            ),

                            // 追加ボタン
                            // 押下すると、TextFieldの値を返却する
                            Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton.icon(
                                    icon: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                    label: const Text('追加'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () async {
                                      //　テーブル作成〜インサート＆ゲットまで
                                      var rep = TodoRepository();
                                      var db = await rep.createConnection();
                                      rep.createTodoListTable(db);
                                      rep.createTaskTable(db);
                                      Map<String, dynamic> value = {
                                        'name': taskTitle
                                      };
                                      print("aa");
                                      print(
                                          await rep.insertTodoList(db, value));
                                      print(await rep.getTodoList(db));

                                      // TextFieldの値を空にして、返却する
                                      String retTitle = taskTitle;
                                      taskTitle = '';
                                      return Navigator.of(context)
                                          .pop(retTitle);
                                    }))
                          ],
                        ),
                      ));
                });

            // 変更を受け取れば処理する
            if (newTitleText != null) {
              setState(() {
                taskList
                    .add(TaskValueObject(0, taskList.length, newTitleText, ''));
              });
            }
          },
          child: const Icon(Icons.add)),
    );
  }
}
