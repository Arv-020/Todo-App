import 'package:flutter/material.dart';
import 'package:todo_list/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 212, 212),
        appBar: _appBar_builder(),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(children: [
              searchBox(),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 20),
                    child: const Text(
                      "All Summary",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const ToDoItem()
                ],
              ))
            ])));
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 25,
            minHeight: 20,
          ),
          border: InputBorder.none,
          hintText: "Search",
        ),
      ),
    );
  }

  AppBar _appBar_builder() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/GJ1xbj6s_m.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
