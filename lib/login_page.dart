import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_shared_pref_app/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () async {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            await preferences.setBool('isLogin', true).then((_) => 
              Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) =>  HomePage())))
            );
          }
        ),
      ),
    );
  }
}