import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo/components/Drawer.dart';
import 'package:flutter_todo/models/Akram_Data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Icon(Icons.check_box),
            SizedBox(width: 9,),
            Text('Todo App')
          ]),
        ),
        endDrawer:  Akram_Drawer(),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [

            ],
          ),
        )
      ),
    );
  }

  Widget ak_details(
      int id, String name, String company, String price1, String price2) {
    return InkWell(
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      name ,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Icon(Icons.abc_outlined),
                  ),

                  //Icon(Icons.local_pharmacy , color: Colors.white,),
                ],
              ),
              color: Akram_Data.appColor1,
              height: 30,
            ),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Akram_Data.appColor1,
                  margin: EdgeInsets.all(0.0),
                  child: SizedBox(
                    //height: 40,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2.0),
                        ),
                        Text(
                          "نقد  " + price1,
                          style: TextStyle(fontSize: 12),
                        ),
                        Divider(
                          thickness: 1,
                          color: Akram_Data.appColor2,
                          height: 0,
                        ),
                        Text(
                          "اجل  " + price2,
                          style: TextStyle(fontSize: 12),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    width:MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width:MediaQuery.of(context).size.width * 0.7,
                          child:
                          Text(
                            company,
                            style:
                            TextStyle(color: Akram_Data.appColor1, fontSize: 14),
                          ),),
                      ],
                    )
                ),
                //Icon(Icons.local_pharmacy , color: Colors.white,),
              ],
            ),
            Divider(
              height: 0,
              thickness: 3,
              color: Akram_Data.appColor2,
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //Padding(padding: EdgeInsets.all(20.0),),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    "اخر تحديث للسعر : ",
                    style: TextStyle(color: Akram_Data.appColor2, fontSize: 14),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Akram_Data.appColor2,
                      size: 25,
                    )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Icon(
                    Icons.menu,
                    color: Akram_Data.appColor2,
                    size: 25,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(0),
            ),
          ],
        ),
        /*shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),*/
        elevation: 5,
        margin: EdgeInsets.all(5),
      ),
      onTap: () {

      },
    );
  }
}
