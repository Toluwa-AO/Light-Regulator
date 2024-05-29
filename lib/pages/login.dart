
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:light_regulator_app/components/my_buttons.dart';
import 'package:light_regulator_app/components/my_text_field.dart';
import 'package:light_regulator_app/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Function()? onTap;

  LoginPage({super.key, required this.onTap});
  void login(BuildContext context)async{
    final authService = AuthService();

    try{
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text,);
    }
    catch(e){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lightbulb_circle, size: 60, color: Theme.of(context).colorScheme.primary,),
                SizedBox(
                  width: 10,
                ),
                Text("Light Regulator", style: TextStyle(
                  fontSize: 28,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text("Welcome back you have been missed", style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary
            ),),
            SizedBox(
              height: 50,
            ),
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
             SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Login',
              onTap: () => login(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text(' Register now.', style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}