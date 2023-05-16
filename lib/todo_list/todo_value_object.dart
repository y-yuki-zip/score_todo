/// Todoリストのタブを表すValueObject
class TodoValueObject {
  // ID(id)
  int id = 0;
  // リスト名(name)
  String name = '';
  // リスト名(name)
  int priority = 0;

  // イニシャライザ
  TodoValueObject(this.name, this.priority);
}
