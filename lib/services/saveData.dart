

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Saved_Data{
  static Future<void> set_data(List<dynamic> _data) async {
    String d = json.encode(_data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('all_tasks', d);
  }

  static Future<List<dynamic>> get_data() async {
    final prefs = await SharedPreferences.getInstance();
    String all_tasks = '';
    all_tasks = (prefs.getString('all_tasks') != null ?prefs.getString('all_tasks'):'')!;
    print (all_tasks);
    if(all_tasks != ''){
      return json.decode(all_tasks);
    }else{
      return [];
    }
  }
}