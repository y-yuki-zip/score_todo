/// Todoリストのタスクを表すValueObject
class TaskValueObject {
  // ID(id)
  int id = 0;
  // リストID(list_id)
  int listID = 0;
  // 描画優先度(priority)
  int priority = 0;
  // タスク名(name)
  String name = '';
  // 詳細(detail)
  String detail = '';
  // 完了フラグ(completed)
  int complated = 0;
  // ゴミ箱に入った日付(trash_date)
  String trashDate = '';

  // イニシャライザ
  TaskValueObject(this.listID, this.priority, this.name, this.detail);

  // completedが0を超えている場合、完了と見なす
  bool get isCompleted {
    return (complated > 0);
  }
}
