import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/models/Akram_Data.dart';

class Akram_Drawer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Colors.indigo,
                height: 140,
                child: DrawerHeader(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.check_box,color: Colors.white),
                      SizedBox(
                        width: 5,
                      ),
                      Text(Akram_Data.appTitle,style: TextStyle(
                        color: Colors.white,
                        fontSize: 22
                      ),)
                    ],
                  ),
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(0),
                ),
              ),

              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Akram_Data.appColor1,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Akram_Data.appColor1 , fontFamily: 'AvenirArabic'),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.add,
                  color: Akram_Data.appColor1,
                ),
                title: Text(
                  'Create new',
                  style: TextStyle(color: Akram_Data.appColor1),
                ),
                onTap: () {

                },
              ),

            ],
          ),
        ));
  }

}
