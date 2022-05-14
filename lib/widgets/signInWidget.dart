import 'package:coders_calendar/widgets/snackBar.dart';
import 'package:coders_calendar/widgets/toastWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        children:  [
          Text('Sign In',style:TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ) ,),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 8,right: 8,bottom: 4),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val){
                        if(val==null || val.isEmpty){
                          return "Please enter email";
                        }
                        return null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Enter the email',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: (val){
                        if(val==null || val.isEmpty){
                          return "Please enter password";
                        }
                        return null;
                      },
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Enter the password',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(onPressed: (){
                      if(_formKey.currentState!.validate())
                      {
                        _formKey.currentState!.save();
                      }
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);
                      if(emailValid==true)
                      {
                        _signInWithEmailAndPassword(context);
                      }
                      else
                      {
                        if(_emailController.text.length!=0)
                          SnackBarItem(context: context).snackBar('Wrong email',Colors.red);
                      }
                    },
                      color: Colors.indigoAccent,
                      child: Text('Sign In',style: TextStyle(
                          color: Colors.white
                      ),),
                      height: 45,
                      minWidth: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (){
                        // Navigator.of(context)
                      },
                      child: Text('Forget Password?',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    )
                  ],
                )),
          ),


        ],
      ),
    );
  }
  void _signInWithEmailAndPassword(context)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', _emailController.text);
      var email = prefs.getString('userEmail');
      Navigator.of(context).pop();
      ToastWidget().toast("$email logged in successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
