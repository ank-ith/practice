import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gotoscreen.dart';

class Preference extends StatelessWidget {
var pref_value=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Column(
      children: [
        TextField(controller:pref_value ,decoration: InputDecoration(hintText: 'name'),),
        ElevatedButton(onPressed: (){
          String data=pref_value.toString() ;
          Sent_data(data);
        }, child: Text('Save Value')),
        ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>goto_Screen()));
        }, child:Text('HighScore') )
      ],
    )),);
  }
}

void Sent_data(String v1) async{
  SharedPreferences Sp_value= await SharedPreferences.getInstance();
  await Sp_value.setString('name', v1);
}
void main() {
  runApp(MaterialApp(
    home: Preference(),
  ));
}
