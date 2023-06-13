import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/screens/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const HomePage(),
  ));
}
