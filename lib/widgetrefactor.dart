import 'package:flutter/material.dart';

class Crddetails extends StatelessWidget{
    final Color? bgcolour;
    final Text? txt;
    final String? imgsrc;
    VoidCallback onpressed;
    Crddetails({this.bgcolour,required this.txt,this.imgsrc,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: bgcolour,child: Column(
      children: [
        MaterialButton(onPressed: onpressed,),
        Image.network(imgsrc!)
      ],
    ),);
  }
  }

