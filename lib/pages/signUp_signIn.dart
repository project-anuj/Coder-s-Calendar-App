
import 'package:coders_calendar/widgets/signInWidget.dart';
import 'package:coders_calendar/widgets/signup_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/forgetPassword.dart';

class SignUpSignIn extends StatefulWidget {
  const SignUpSignIn({Key? key}) : super(key: key);

  @override
  State<SignUpSignIn> createState() => _SignUpSignInState();
}

class _SignUpSignInState extends State<SignUpSignIn> {
  bool isSignIn = false;
  bool isForgetPassword = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isSignIn = false;
      isForgetPassword = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      borderRadius:  BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*(2/3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Padding(
                padding: EdgeInsets.only(top:10,right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Text('Later',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1,
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 40,),

              // ForgetPasswordWidget(),
              isSignIn==false?SignUpWidget():SignInWidget(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  isSignIn==false?Text('Already have an account?'):Text('Don\'t have an account?'),
                  SizedBox(width: 7,),


                  isSignIn ==false? InkWell(
                    onTap: (){
                      setState(() {
                        isSignIn = true;
                      });
                    },
                    child: Text('Sign In',style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),),
                  ):InkWell(
                    onTap: (){
                      setState(() {
                        isSignIn = false;
                      });
                    },
                    child: Text('Sign Up',style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),

                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(

                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Icon(FontAwesomeIcons.google,
                  ),
                  SizedBox(width: 10,),
                  Text('Continue with Google',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),)
                ],
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
