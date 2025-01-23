import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/homepage.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState()=> _loginState();
}
class _loginState extends State<Login>{

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordContoller=TextEditingController();

  Future<void> _login()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordContoller.text.trim()
        );
        print("User Loggedin");
    }catch(e){
      print("Login error: $e");
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message){
    showDialog(context: context,
    builder: (BuildContext context)=>AlertDialog(
      title: Text("Error"),
      content: Text(message),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        },
        child: Text("OK"))
      ],
    )
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.blue,fontSize: 20),
                  ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.blue,fontSize: 20),
                  ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: (){
                _login();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
              }, child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),)),
            SizedBox(height: 10,),
            GestureDetector(
              onTap:(){},
              child:  Text("Forgot password ?",style: TextStyle(fontSize: 16,color: Colors.blue),)),
          ],
        ),
      ),
    );
  }
}