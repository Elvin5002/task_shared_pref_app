import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_shared_pref_app/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Logout'),
          onPressed: () async {
            SharedPreferences preferences = await SharedPreferences.getInstance();
            await preferences.setBool('isLogin', false).then((_) => 
              Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => LoginPage())))
            );
          }
        ),
      ),
    );
  }
}