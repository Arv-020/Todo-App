import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoList = ToDo.todoList();
  final _todocontroller = TextEditingController();
  List<ToDo> _foundToDO = [];

  @override
  void initState() {
    _foundToDO = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 212, 212),
      appBar: _appBarBuilder(),
      drawer: _sideBarBuilder(), // Add the drawer/sidebar
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          "All Summary",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDO.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDOChange: _handleToDoChange,
                          onDeleteItem: _deleteItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todocontroller,
                      decoration: const InputDecoration(
                        hintText: "Add Item to do",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addItem(_todocontroller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addItem(String todo) {
    if (todo.isEmpty == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text("Todo cannot be empty."),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        todoList.add(
          ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: todo,
          ),
        );
      });
    }

    _todocontroller.clear();
  }

  void _runfilter(String keyword) {
    List<ToDo> results = [];
    if (keyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where(
            (item) =>
                item.todoText!.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();
    }
    setState(() {
      _foundToDO = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextField(
        onChanged: (value) => _runfilter(value),
        decoration: const InputDecoration(
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

  AppBar _appBarBuilder() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      title: const Text('Home Page'),
      actions: [
        Container(
          // width: 150,
          margin: const EdgeInsets.only(right: 10),
          child: DropdownButton(
            underline: Container(
              color: Colors.transparent,
            ),
            isExpanded: false,
            icon: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            items: [
              DropdownMenuItem(
                value: 'profile',
                child: Builder(
                  builder: (context) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 0),
                          margin: const EdgeInsets.only(left: 0),
                          child: const Text("Profile")),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset('assets/GJ1xbj6s_m.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const DropdownMenuItem(
                value: 'settings',
                child: Text('Settings'),
              ),
              const DropdownMenuItem(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
            onChanged: (value) {
              // Handle the selection here
            },
          ),
        ),
      ],
    );
  }

  Drawer _sideBarBuilder() {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(left: 0),
        children: [
          Column(children: [
            Container(
              height: 100,
              width: 400,
              decoration: const BoxDecoration(),
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'ToDo App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 45,
              // margin: const EdgeInsets.only(bottom: 0, top: 0),
              child: ListTile(
                title: const Text('Linkedin Profile'),
                onTap: () {
                  // Handle side bar option 1
                  Navigator.pop(context); // Close the sidebar
                },
              ),
            ),

            // margin: const EdgeInsets.only(top: 0),

            ListTile(
              title: const Text('Donate Money'),
              onTap: () {
                // Handle side bar option 2
                Navigator.pop(context); // Close the sidebar
              },
            ),
          ])
        ],
      ),
      // Add more ListTile widgets for additional options
    );
  }
}
