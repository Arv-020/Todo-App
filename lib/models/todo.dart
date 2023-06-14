class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: "tanu ko laat marna", isDone: true),
      ToDo(id: '02', todoText: "tanu bachi h", isDone: true),
      ToDo(
        id: '03',
        todoText: "tanu ka homework",
      ),
      ToDo(id: '04', todoText: "tanu ko daat pdi", isDone: true),
      ToDo(id: '05', todoText: "tanu ro rhi h", isDone: true),
    ];
  }
}
