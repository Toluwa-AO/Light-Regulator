import 'package:flutter/material.dart';
import 'package:light_regulator_app/pages/login.dart';
import 'package:light_regulator_app/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show login page
  bool showloginPage = true;

  //toggle between login and register
  void togglePage(){
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginPage){
      return LoginPage(
        onTap: togglePage,
      );
    }else{
      return RegisterPage(
        onTap: togglePage,
      );
    }
  }
}