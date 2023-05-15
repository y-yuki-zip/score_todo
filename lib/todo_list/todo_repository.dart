import 'package:score_todo/abstract_repository.dart';
import 'package:sqflite/sqflite.dart';

/// Todoリストのリポジトリ
class TodoRepository extends AbstractRepository {
  // 主キー
  final _id = 'id';
  // Todoリストの主キー
  final _listID = 'list_id';
  // 表示優先度
  final _priority = 'priority';
  // タスク名
  final _name = 'name';
  // タスク詳細
  final _detail = 'detail';
  // Todoリストテーブル
  final _todoListTable = 'TodoList';
  // Todoリストタスクテーブル
  final _todoTaskTable = 'TodoTask';

  /// Todoリストテーブル作成
  void createTodoListTable() async {
    // Todo: データベースを確立させる(createConnectionを使ってみる。ダメなら、openDatabaseを見直す)
    Database database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $_todoListTable ('
          '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
          '$_name TEXT NOT NULL'
          ')');
    });
    database.close();
  }

  /// Todoリストタスクテーブル作成
  void createTaskTable() async {
    Database database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $_todoTaskTable ('
          '$_id INTEGER PRIMARY KEY,'
          '$_listID INTEGER,'
          '$_priority INTEGER,'
          '$_name TEXT,'
          '$_detail TEXT'
          ')');
    });
    database.close();
  }

  /// Todoタスクを挿入する
  ///
  /// [db]は接続した状態のDatabaseオブジェクトを渡す
  /// [value]は挿入したいデータを渡す
  /// 返却値は挿入した行番号を返す
  // Future<int> insertTodoList(
  //     Future<Database> db, Map<String, dynamic> value) async {
  //   return await db.(
  //     _todoListTable,
  //     value,
  //     conflictAlgorithm: ConflictAlgorithm.rollback,
  //   );
  // }

  void insertTodoList(Map<String, dynamic> value) async {
    Database database = await openDatabase(dbPath, onOpen: (Database db) async {
      await db.insert(
        _todoListTable,
        value,
        conflictAlgorithm: ConflictAlgorithm.rollback,
      );
    });
    database.close();
  }

  /// Todoリストを取得する
  void getTodoList() async {
    Database database = await openDatabase(dbPath, onOpen: (Database db) async {
      var result = await db.query(_todoListTable);
      print("$result");
    });
    database.close();
  }

  /// Todoリストを更新する
  void updateTodoTask() {}

  /// Todoリストを削除する
  void deleteTodoList() {}
}
