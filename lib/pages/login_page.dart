import 'package:auth/auth/auth_service.dart';
import 'package:auth/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authServie=AuthService();

  final _emailcontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();

  void Login()async{
    final email=_emailcontroller.text.trim();
    final password=_passwordcontroller.text.trim();
    try{
      await authServie.signinwithEmailPassword(email, password);
    }
    catch(error){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error$error")));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          TextField(
            controller: _emailcontroller,
            decoration: InputDecoration(
              labelText: "Email"
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: _passwordcontroller,
            decoration: InputDecoration(
              labelText: "password"
            ),
            
          ),
          ElevatedButton(onPressed: Login, child: Text("Login")),
          GestureDetector(
              onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));},
              child: Center(child: Text("Don't have an account Sign Up")))
          
        ],
      ),
    );
  }
}
