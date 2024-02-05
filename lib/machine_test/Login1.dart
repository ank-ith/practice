import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignUp1.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var email_ctrl = TextEditingController();
  var pass_ctrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                  'https://i.pinimg.com/564x/0e/99/57/0e995765397e7594f1587413659c8e70.jpg'),
              Text(
                'Login to Active eCommerce',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: email_ctrl,
                          validator: (value) {
                            if (value == null || value.isEmpty ||!value.contains('@')) {
                              return 'Please enter a valid email id';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'jhondoe@example.com',
                              border: OutlineInputBorder())),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          validator: (value) {
                            if (value!.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'password must have atleast 6 charachters')));
                            }
                          },
                          controller: pass_ctrl,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder())),
                    ),
                  ]),
                ),
              ),
              Column(
                children: [
                  MaterialButton(
                    height: 50,
                    minWidth: 300,
                    color: Colors.redAccent,
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        check_and_validateUser(email_ctrl.text, pass_ctrl.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Enter valid credentials')));
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text('Log in'), //color: Colors.redAccent),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Already have an account ?'),
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 300,
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void check_and_validateUser(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final checkemail = prefs.getString('email') ?? 'none';
    final checkpass = prefs.getString('password') ?? 'none';
    if (email == checkemail && password == checkpass) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No such user found')));
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}
