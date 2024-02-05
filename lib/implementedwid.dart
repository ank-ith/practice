import 'package:flutter/material.dart';
import 'package:practice/widgetrefactor.dart';

class Usage extends StatelessWidget {
  const Usage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Crddetails(txt: Text('Enter'), onpressed:(){},bgcolour: Colors.blueAccent,imgsrc: 'https://i.pinimg.com/236x/4b/f9/ef/4bf9efd7e371449b73d577bca8a9c466.jpg', ),);
  }
}
void main (){
  runApp(MaterialApp(home: Usage(),));
}