import 'package:coders_calendar/admin/admin_ui.dart';
import 'package:coders_calendar/admin/authUi.dart';
import 'package:coders_calendar/widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{

  signInUser(context,email,pass) async
  {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:email,
          password: pass);
      if(userCredential!=null)
        {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (_)=>AdminPanel()));
        }
    } on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        SnackBarItem(context: context).snackBar('No user found for given credentials.',Colors.red);
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        SnackBarItem(context: context).snackBar('Wrong password',Colors.red);
      }
    }
  }
  signout(context)async{
    await FirebaseAuth.instance.signOut();
    if(FirebaseAuth.instance.currentUser == null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (_)=>AuthUI()));
      }
    print("sign out");
  }
}