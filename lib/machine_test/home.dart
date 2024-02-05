import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    getUser();
  super.initState();
  }
  String? user_name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Welcome $user_name')),);
  }

  Future <void> getUser() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    user_name=await prefs.getString('name')??'blank';
  }
}
