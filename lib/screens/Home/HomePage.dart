import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo/components/Drawer.dart';
import 'package:flutter_todo/models/Akram_Data.dart';
import 'package:flutter_todo/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //Akram_Data.all_tasks.foreach((key,value)=>_list.add(value['name']));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: const [
            Icon(Icons.check_box),
            SizedBox(
              width: 9,
            ),
            Text('Todo App')
          ]),
        ),
        endDrawer: Akram_Drawer(),
        body: Container(
          padding: const EdgeInsets.fromLTRB(5,20,5,10),
          color: Colors.white,
          child: ReorderableListView(
            onReorder: (int start, int current) {
              // dragging from top to bottom
              if (start < current) {
                int end = current - 1;
                Map<String, String> startItem = Akram_Data.all_tasks[start];
                int i = 0;
                int local = start;
                do {
                  Akram_Data.all_tasks[local] = Akram_Data.all_tasks[++local];
                  i++;
                } while (i < end - start);
                Akram_Data.all_tasks[end] = startItem;
              }
              // dragging from bottom to top
              else if (start > current) {
                Map<String, String> startItem = Akram_Data.all_tasks[start];
                for (int i = start; i > current; i--) {
                  Akram_Data.all_tasks[i] = Akram_Data.all_tasks[i - 1];
                }
                Akram_Data.all_tasks[current] = startItem;
              }
              setState(() {
                Akram_Data.set_all_tasks(Akram_Data.all_tasks);
              });
            },
            children: [
              for (int i = 0; i < Akram_Data.all_tasks.length; i++)
                ListTile(
                  key: Key("${i}"),
                  leading: InkWell(
                      child: Icon(
                        Akram_Data.is_task_completed(i)
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                      onTap: () {
                        setState(() {
                          Akram_Data.task_complete(i);
                        });
                      }),
                  title: Text("${Akram_Data.all_tasks[i]['name']}",
                      style: TextStyle(
                          decoration: Akram_Data.is_task_completed(i)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none)),
                  subtitle: Text("${Akram_Data.all_tasks[i]['description']}",
                      style: TextStyle(
                          decoration: Akram_Data.is_task_completed(i)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none)),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Row(
                      children: [
                        InkWell(
                            child: const Icon(
                              Icons.edit,
                              color: Colors.indigoAccent,
                            ),
                            onTap: () {
                              Ak_Route.id = i;
                              Navigator.pushNamed(context, '/update');
                            }),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title:
                                      const Text("Confirmation"),
                                      content:
                                      const Text("Are you sure you want to delete?"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: const Text(
                                              "Yes"),
                                          onPressed: () {
                                            setState(() {
                                              Akram_Data.del_task(context, i);
                                            });
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Deleted Successfully')),
                                            );
                                          },
                                        ),
                                        FlatButton(
                                          child: const Text(
                                              "No"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });

                            })
                      ],
                    ),
                  ),
                )
              //_list.map((item) => .toList()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
