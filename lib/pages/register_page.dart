import 'package:auth/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final authService=AuthService();
  final _emailcontroller=TextEditingController();
  final _passwordcontroller=TextEditingController();
  final _confirmpasswordcontroller=TextEditingController();
  void Signup()async{
    final email=_emailcontroller.text.trim();
    final password=_passwordcontroller.text.trim();
   final Confirmpassword=_confirmpasswordcontroller.text.trim();
   if(password !=Confirmpassword){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password don't match")));
      return;
   };
   try{
    await authService.SignUpwithemailpassword(email, password);
   Navigator.pop(context);
   }
   catch(error){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $error")));
   }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(title: Text("Sign Up"),
         centerTitle: true,
         ),
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
          TextField(
            controller: _confirmpasswordcontroller,
            decoration: InputDecoration(
                labelText: "Confirm password"
            ),

          ),
          SizedBox(height: 12,),
          ElevatedButton(onPressed: Signup, child: Text("SignUp")),

        ],
      ),
    );
  }
}
