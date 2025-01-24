import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/login.dart';

class Forgotpassword extends StatefulWidget{
  @override
  State<Forgotpassword> createState()=> _forgotpasswordState();
}
class _forgotpasswordState extends State<Forgotpassword>{

  TextEditingController emailController=TextEditingController();
  bool _isLoading=false;
  String? _errorMessage;

  Future <void> _sendForgotPasswordResetEmail()async{
    setState(() {
      _isLoading=true;
      _errorMessage=null;
    });
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: emailController.text.trim(),
      );
      setState(() {
        _isLoading=false;
      });
      _ShowDialog("Password reset email sent!.please check your inbox");
  } on FirebaseAuthException catch(e){
    setState(() {
      _isLoading=false;
    });
    _ShowDialog(e.message ?? "an error occurred");
  }
  }

  void _ShowDialog(String message){
    showDialog(context: context, builder: (context)=>
      AlertDialog(
        title: Text("Notification"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("OK"))
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset your password",style: TextStyle(fontSize: 30,color: Colors.white),),
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
            Text('''Enter the email associated with your account and we'll\nsend you password reset information sent to''',style: TextStyle(fontSize: 15,color: Colors.black),),
            SizedBox(height: 20,),
            TextField(
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
            Container(
              height: 40,
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: (){
                  _sendForgotPasswordResetEmail();
                }, child: Text("Submit",style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Return to",style: TextStyle(fontSize: 18,color: Colors.black),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child:  Text("login ",style: TextStyle(fontSize: 18,color: Colors.blue),)),
                  Text("?",style: TextStyle(fontSize: 18,color: Colors.black),),
              ],
            )
          ],
        ),
      ),
    );
  }
}