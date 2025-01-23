import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/login.dart';

class Signup extends StatefulWidget{
  @override
  State<Signup> createState()=> _signupState();
}
class _signupState extends State<Signup>{

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordContoller=TextEditingController();

  Future <void> _signUp()async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordContoller.text.trim());
        print("User signed up");
    }catch(e){
      print("Signup error: $e");
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
        title: Text("Sign up",style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.blue,fontSize: 20),
                  ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passwordContoller,
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
                _signUp();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
              }, child: Text("Sign up",style: TextStyle(fontSize: 20,color: Colors.white),)),
              SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already registered ?",style: TextStyle(fontSize: 16,color: Colors.black),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){},
                  child: Text("Login",style: TextStyle(fontSize: 17,color: Colors.blue),)),
              ],
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap:(){},
              child:  Text("Forgot password ?",style: TextStyle(fontSize: 16,color: Colors.blue),)),
              SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    onPressed: (){}, child: Row(
                    children: [
                      Text("sign in "),
                      Icon(Icons.car_crash)
                    ],
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}