import 'package:bootcamp_goua/signup_in/login_page.dart';
import 'package:bootcamp_goua/signup_in/register_page.dart';
import 'package:flutter/material.dart';
class LogReg extends StatefulWidget {
  const LogReg({super.key});

  @override
  State<LogReg> createState() => _LogRegState();
}

class _LogRegState extends State<LogReg> {

  //login
  bool showLogPage=true;
  //
  void togglePages(){
    setState(() {
      showLogPage=!showLogPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLogPage){
      return LoginPage(
        onTap: togglePages,
      );
    }
    else{
      return RegisterPage(
        onTap: togglePages,
      );
    }

  }
}
