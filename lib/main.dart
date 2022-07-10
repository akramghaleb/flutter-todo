import 'package:flutter/material.dart';
import 'package:flutter_todo/theme/style.dart';
import 'package:flutter_todo/routes.dart';
import 'package:flutter/cupertino.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ExampleApp());
}
class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          fontFamily: 'ElMessiri',
          primarySwatch: Colors.indigo,
        ),
        initialRoute: '/',
        routes: Ak_Route.routes,
        );
  }
}