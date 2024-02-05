import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class goto_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Center(child: Text('${getvalue()}'),)),);
  }
}
Future<String> getvalue() async{
  var datarecv;
  final shareddata=await SharedPreferences.getInstance();
  datarecv=shareddata.getString('name');
  return datarecv;
}