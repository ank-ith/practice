import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgetrefactor.dart';

class Gridprtce extends StatefulWidget {

  @override
  State<Gridprtce> createState() => _GridprtceState();
}

class _GridprtceState extends State<Gridprtce> {
  var textcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigoAccent, Colors.pinkAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        centerTitle: true,
        title: Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
        )
          ,elevation: 0,
      ),
      body: Column(
        children: [
          TextFormField(controller: textcontroller,),
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.pinkAccent, Colors.indigoAccent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child:GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (context, index) =>Card(
                child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.pinkAccent,Colors.blueAccent],begin: Alignment.topCenter,end: Alignment.bottomCenter)),child: Icon(Icons.ac_unit),),

              ),),
          ),
        ],
      ),

    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Gridprtce(),
    debugShowCheckedModeBanner: false,
  ));
}
