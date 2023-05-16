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
  // タスク名＆リスト名
  final _name = 'name';
  // タスク詳細
  final _detail = 'detail';
  // Todoリストテーブル
  final _todoListTable = 'TodoList';
  // Todoリストタスクテーブル
  final _todoTaskTable = 'TodoTask';

  /// Todoリストテーブル作成
  void createTodoListTable(Database db) async {
    await db.execute('CREATE TABLE $_todoListTable ('
        '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$_name TEXT NOT NULL'
        ')');
  }

  /// Todoリストタスクテーブル作成
  void createTaskTable(Database db) async {
    await db.execute('CREATE TABLE $_todoTaskTable ('
        '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$_name TEXT NOT NULL'
        ')');
  }

  /// Todoタスクを挿入する
  ///
  /// [db]は接続した状態のDatabaseオブジェクトを渡す
  /// [value]は挿入したいデータを渡す
  /// 返却値は挿入した行番号を返す
  Future<int> insertTodoList(Database db, Map<String, dynamic> value) async {
    return await db.insert(
      _todoListTable,
      value,
      conflictAlgorithm: ConflictAlgorithm.rollback,
    );
  }

  /// Todoリストを取得する
  ///
  /// [db]は接続した状態のDatabaseオブジェクトを渡す
  /// 返却値は取得したTodoリストの連想配列の配列を返す
  Future<List<Map<String, Object?>>> getTodoList(Database db) async {
    return await db.query(_todoListTable);
  }

  /// Todoリストを更新する
  void updateTodoTask() {}

  /// Todoリストを削除する
  ///
  /// [db]は接続した状態のDatabaseオブジェクトを渡す
  /// [id]は削除対象の主キーを渡す
  /// 返却値は削除した行数を返す
  Future<int> deleteTodoList(Database db, int id) async {
    return await db.delete(_todoListTable, where: 'id = ?', whereArgs: [id]);
  }
}
