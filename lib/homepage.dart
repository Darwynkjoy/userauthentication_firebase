import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_authentication/login.dart';

class Homepage extends StatefulWidget{
  @override
  State<Homepage> createState()=> _homepageState();
}
class _homepageState extends State<Homepage>{

  void _logOut()async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    }catch(e){
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home",style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () {
            
          },icon: Icon(Icons.logout_outlined,color: Colors.white,size: 30,))
        ],
      ),
      body: Center(child: Text("homeScreen",style: TextStyle(fontSize: 25,),)),
    );
  }
}