
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:light_regulator_app/components/my_buttons.dart';
import 'package:light_regulator_app/components/my_text_field.dart';
import 'package:light_regulator_app/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  final Function()? onTap;

  RegisterPage({super.key,required this.onTap});
  void register(BuildContext context){
    final _auth = AuthService();

   //password match create user 
   if (_passwordController.text == _confirmpasswordController.text){
    try{
       _auth.signUpWithEmailPassword(_emailController.text, _passwordController.text);
    // ignore: empty_catches
    } catch (e){
       showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }
   }
   else{
    showDialog(context: context, builder: (context) => const AlertDialog(
        title: Text("Password dont match"),
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
            Icon(Icons.message, size: 60, color: Theme.of(context).colorScheme.primary,),
            SizedBox(
              height: 50,
            ),
            Text("Let's create an account for you", style: TextStyle(
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
              height: 10,
            ),
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpasswordController,
            ),
             SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already a member? ', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Login now.', style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}