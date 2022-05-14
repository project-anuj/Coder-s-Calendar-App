import 'package:coders_calendar/widgets/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        children:  [
          Text('Create an account',style:TextStyle(
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
                          _register(context);
                      }
                      else
                      {
                      if(_emailController.text.length!=0)
                      SnackBarItem(context: context).snackBar('Wrong email',Colors.red);
                      }
                      },
                    color: Colors.indigoAccent,
                     child: Text('Create an Account',style: TextStyle(
                       color: Colors.white,
                     ),),
                      height: 45,
                     minWidth: 200,
                   ),

                  ],
                )),
          ),


        ],
      ),
    );
  }

  void _register(context)async{
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      // Navigator.of(context).pop();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', _emailController.text);
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print('The password provided is too weak.');
      }
      else if(e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
      }
    }catch(e){
      print(e);
    }
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
