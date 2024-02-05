import 'package:flutter/material.dart';
import 'package:practice/machine_test/Login1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formkey = GlobalKey<FormState>();
  var name_ctrl = TextEditingController();
  var email_ctrl = TextEditingController();
  var pass_ctrl = TextEditingController();
  var repass_ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(key: formkey,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Image.network(
                    'https://i.pinimg.com/564x/0e/99/57/0e995765397e7594f1587413659c8e70.jpg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Text(
                  'Join Active eCommerce',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(controller: name_ctrl,
                    decoration: InputDecoration(labelText:'Name' ,
                    hintText: 'jhon doe',
                    border: OutlineInputBorder()),
                  ),
                ),SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(controller: email_ctrl,
                    decoration: InputDecoration(labelText: 'Email',
                    hintText:'jhondoe@example.com', border: OutlineInputBorder()),
                  ),
                ),SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(controller: pass_ctrl,
                    decoration: InputDecoration(labelText: 'Password',
                         border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,15,20),
                  child: TextFormField(controller: repass_ctrl,
                    decoration: InputDecoration(labelText: 'Retype password',
                        border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                ),
                MaterialButton(height: 50,
                  minWidth: 300,
                  color: Colors.redAccent,
                  onPressed: () {
                  if(repass_ctrl.text==pass_ctrl.text) {
                    setData();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please check your password')));
                  }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text('Sign Up'), //color: Colors.redAccent),
                ),
                Text('Already have an account ?'),
                MaterialButton(height: 50,
                  minWidth: 300,
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                        builder: (context) => LoginScreen()));
                  },
                  child: Text('Log In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setData() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('name', name_ctrl.text);
    prefs.setString('email', email_ctrl.text);
    prefs.setString('password', pass_ctrl.text);
  }
}

