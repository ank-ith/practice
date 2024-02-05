import 'dart:async';

import 'package:flutter/material.dart';

import 'Login1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    super.initState();
    // await Future.delayed(
    //     Duration(milliseconds: 1700),
    //         () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (context) => LoginScreen(),
    //     )));
    Timer(
      Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          color: Colors.redAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://i.pinimg.com/236x/e4/6d/54/e46d54d68cbbde79380e9af7c7a4e68d.jpg',
                  height: 150,
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Text(
                      'v1.01.1',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '@xxxxxx',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
