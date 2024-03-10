import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_shared_pref_app/home_page.dart';
import 'package:task_shared_pref_app/login_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isShowLogin;

  @override
  void initState(){
    getLoginShow();
    super.initState();
  }

  void getLoginShow() async{
    final preferences = await SharedPreferences.getInstance();
    isShowLogin = preferences.getBool('isLogin');
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isShowLogin == true ? HomePage(): LoginPage(),
    );
  }
}
