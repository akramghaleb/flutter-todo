import 'package:flutter/material.dart';
import 'package:flutter_todo/models/Akram_Data.dart';
import 'package:flutter_todo/services/saveData.dart';
import 'package:flutter_todo/theme/style.dart';
import 'package:flutter_todo/routes.dart';
import 'package:flutter/cupertino.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Akram_Data.all_tasks = await Saved_Data.get_data() as List<dynamic>;
  runApp(ExampleApp());
}
class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: appTheme(),
        initialRoute: '/',
        routes: Ak_Route.routes,
        );
  }
}