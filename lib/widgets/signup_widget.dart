import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 270,
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
}
