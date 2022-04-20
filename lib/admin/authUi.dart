import 'package:coders_calendar/firebase/firebase_auth.dart';
import 'package:coders_calendar/widgets/snackBar.dart';
import 'package:flutter/material.dart';

class AuthUI extends StatefulWidget {
  const AuthUI({Key? key}) : super(key: key);

  @override
  State<AuthUI> createState() => _AuthUIState();
}

class _AuthUIState extends State<AuthUI> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Admin Auth'),),
        body: Padding(
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
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      if(_formKey.currentState!.validate())
                        {
                          _formKey.currentState!.save();
                        }
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);
                      if(emailValid==true)
                        {
                          FirebaseAuthService().signInUser(context,_emailController.text,_passwordController.text);
                        }
                      else
                        {
                          if(_emailController.text.length!=0)
                          SnackBarItem(context: context).snackBar('Wrong email',Colors.red);
                        }
                        },
                    child: const Text('Submit'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
