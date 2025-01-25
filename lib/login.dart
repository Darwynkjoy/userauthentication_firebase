import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/homepage.dart';
import 'package:user_authentication/passwordreset.dart';
import 'package:user_authentication/signup.dart';

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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login",style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },icon:  Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.blue,fontSize: 20),
                  hintText: "Example@email.com",
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                  ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordContoller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.blue,fontSize: 20),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                  ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 40,
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: (){
                  _login();
                }, child: Text("Login",style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotpassword()));
              },
              child:  Text("Forgot password ?",style: TextStyle(fontSize: 18,color: Colors.blue),)),
              SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an Account ?",style: TextStyle(fontSize: 18,color: Colors.black),),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                  },
                  child:  Text("Signup",style: TextStyle(fontSize: 18,color: Colors.blue),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}