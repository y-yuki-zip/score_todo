import 'package:score_todo/abstract_repository.dart';
import 'package:sqflite/sqflite.dart';

/// Todoリストのリポジトリ
class TodoRepository extends AbstractRepository {
  // 主キー
  final id = 'id';

  // Todoリストの主キー
  final listID = 'list_id';

  // 表示優先度
  final priority = 'priority';

  // タスク名
  final name = 'name';

  // タスク詳細
  final detail = 'detail';

  /// Todoリストテーブル作成
  void createTodoListTable() async {
    final table = 'TodoList';
    Database database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $table ('
          '$id INTEGER PRIMARY KEY,'
          '$listID INTEGER,'
          '$priority INTEGER,'
          '$name INTEGER PRIMARY KEY,'
          '$detail TEXT, value INTEGER, num REAL'
          ')');
    });
  }

  /// Todoリストタスクテーブル作成
  void createTaskTable() async {
    Database database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE TodoTask (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    });
  }

  /// Todoリストを取得する
  void getTodoList() {}

  /// Todoタスクを挿入する
  void insertTodoTask() {}

  /// Todoリストを更新する
  void updateTodoTask() {}

  /// Todoリストを削除する
  void deleteTodoList() {}
}
