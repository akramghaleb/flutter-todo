import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo/services/saveData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Akram_Data {
  static String appTitle = "Todo App";
  static Color appColor1 = Color(0xFF1e2e5e);

  static List<dynamic> all_tasks = [

  ];

  static void set_all_tasks(List<dynamic> t) {
    all_tasks = t;
    Saved_Data.set_data(all_tasks);
  }

  static void task_complete(int id) {
    all_tasks[id]['complete'] = all_tasks[id]['complete'] == '0' ? '1' : '0';
    Saved_Data.set_data(all_tasks);
  }

  static bool is_task_completed(int id) {
    return all_tasks[id]['complete'] == '1' ? true : false;
  }

  static void add_task(String name, String description) {
    all_tasks.add({'name': name, 'description': description, 'complete': '0'});
    Saved_Data.set_data(all_tasks);
  }

  static void upd_task(int id,String name, String description, complete) {
    all_tasks[id]={'name': name, 'description': description, 'complete': complete};
    Saved_Data.set_data(all_tasks);
  }

  static void del_task(BuildContext context,int id) {
    all_tasks.removeAt(id);
    Saved_Data.set_data(all_tasks);
  }
}
