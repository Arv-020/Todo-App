import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/screens/home.dart';

void main() {
  // to change the color of status bar
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MaterialApp(
    // to remove the debug badge
    debugShowCheckedModeBanner: false,
    // theme: ThemeData(primarySwatch: Colors.blue),
    home: HomePage(),
  ));
}
