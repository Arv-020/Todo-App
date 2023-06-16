class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: "HomeWork", isDone: true),
      ToDo(id: '02', todoText: "Study", isDone: true),
      ToDo(
        id: '03',
        todoText: "Cricket",
      ),
      ToDo(id: '04', todoText: "Music", isDone: true),
      ToDo(id: '05', todoText: "buying the clothes", isDone: true),
    ];
  }
}
