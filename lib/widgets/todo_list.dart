import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDOChange;
  final onDeleteItem;
  const ToDoItem(
      {super.key,
      required this.todo,
      required this.onToDOChange,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          // print("clicked me");
          onToDOChange(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          // using ternary to assign either the task is done or not
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            // used ternary to assign line through or not according to task is done or not
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
            padding: const EdgeInsets.all(0),
            // margin: const EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              onPressed: () {
                onDeleteItem(todo.id);
              },
              icon: const Icon(Icons.delete),
            )),
      ),
    );
  }
}
