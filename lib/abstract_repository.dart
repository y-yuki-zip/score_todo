import 'package:sqflite/sqflite.dart';

/// リポジトリで共通で使う抽象クラス
abstract class AbstractRepository {
  // データベースの保存先を示すファイルパス
  final dbPath = 'score_todo_db.db';
  // データベースの接続情報
  static Database? _db;

  /// データベースとの接続情報
  ///
  /// (1).データベースとの接続が確立されていない場合、確立した上で返却する
  /// (2).データベースとの接続が確立されていれば、それを返却する
  Future<Database> createConnection() async {
    // _dbはアンラップできないため、ローカル変数に値を移す
    var db = _db;
    db ??= await openDatabase(dbPath);
    return db;
  }
}
