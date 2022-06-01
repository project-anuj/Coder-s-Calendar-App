import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/strings.dart';
import '../widgets/aboutDialog.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController codeForcesController = TextEditingController();
  TextEditingController topCoderController = TextEditingController();
  TextEditingController atCoderController = TextEditingController();
  TextEditingController codeChefController = TextEditingController();
  TextEditingController hackerRankController = TextEditingController();
  TextEditingController hackerEarthController = TextEditingController();
  TextEditingController kickStartController = TextEditingController();
  TextEditingController leetCodeController = TextEditingController();

  bool isEnableCodeForces = false;
  bool isEnableTopCoder = false;
  bool isEnableAtCoder = false;
  bool isEnableCodeChef = false;
  bool isEnableHackerRank = false;
  bool isEnableHackerEarth = false;
  bool isEnableKickStart = false;
  bool isEnableLeetCode = false;

  @override
  void initState() {
    super.initState();
    getSharedPref();
  }

  getSharedPref()async{
    final pref = await SharedPreferences.getInstance();
    codeForcesController.text = pref.getString("codeForcesHandle")??"";
    topCoderController.text = pref.getString("topCoderHandle")??"";
    atCoderController.text = pref.getString("atCoderHandle")??"";
    codeChefController.text = pref.getString("codeChefHandle")??"";
    hackerRankController.text = pref.getString("hackerRankHandle")??"";
    hackerEarthController.text = pref.getString("hackerEarthHandle")??"";
    kickStartController.text = pref.getString("kickStartHandle")??"";
    leetCodeController.text = pref.getString("leetCodeHandle")??"";
  }
  setSharedPref(handle,value)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(handle, value);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Settings'),
          actions: [
            InkWell(
                onTap: (){
                  AboutDialogWidget().dialogWidget(context,Strings().settigsAboutTitle);
                },
                child: CircleAvatar(child: Icon(Icons.question_mark))),
            SizedBox(width: 10,),
          ],
          ),
          body:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("HANDLES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 8,right: 8,bottom: 4),
                  child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textWidget("CodeForces Handle"),
                            SizedBox(height: 10,),
                            formWidget(codeForcesController,isEnableCodeForces,1),
                            SizedBox(height: 20,),
                            textWidget("TopCoder Handle"),
                            SizedBox(height: 10,),
                            formWidget(topCoderController,isEnableTopCoder,2),
                            SizedBox(height: 20,),
                            textWidget("AtCoder Handle"),
                            SizedBox(height: 10,),
                            formWidget(atCoderController,isEnableAtCoder,3),
                            SizedBox(height: 20,),
                            textWidget("CodeChef Handle"),
                            SizedBox(height: 10,),
                            formWidget(codeChefController,isEnableCodeChef,4),
                            SizedBox(height: 20,),
                            textWidget("HackerRank Handle"),
                            SizedBox(height: 10,),
                            formWidget(hackerRankController,isEnableHackerRank,5),
                            SizedBox(height: 20,),
                            textWidget("HackerEarth Handle"),
                            SizedBox(height: 10,),
                            formWidget(hackerEarthController,isEnableHackerEarth,6),
                            SizedBox(height: 20,),
                            // textWidget("kickStart Handle"),
                            // SizedBox(height: 10,),
                            // formWidget(kickStartController,isEnableKickStart,7),
                            // SizedBox(height: 20,),
                            textWidget("LeetCode Handle"),
                            SizedBox(height: 10,),
                            formWidget(leetCodeController,isEnableLeetCode,8),
                            SizedBox(height: 20,),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
  textWidget(text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.indigo,
        decoration: TextDecoration.underline,
        decorationThickness: 2,
      ),
    );
  }
  formWidget(controller,isEnabled,int handleNumber){

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,

            enabled: isEnabled,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(width: 10,),
        MaterialButton(
            onPressed: (){
                setState(() {
                 if(handleNumber==1)
                   {
                     isEnableCodeForces = ! isEnableCodeForces;
                     setSharedPref("codeForcesHandle", codeForcesController.text);
                   }
                 else if(handleNumber==2)
                   {
                     isEnableTopCoder = ! isEnableTopCoder;
                     setSharedPref("topCoderHandle", topCoderController.text);
                   }  else if(handleNumber==3)
                   {
                     isEnableAtCoder = ! isEnableAtCoder;
                     setSharedPref("atCoderHandle", atCoderController.text);
                   }  else if(handleNumber==4)
                   {
                     isEnableCodeChef = ! isEnableCodeChef;
                     setSharedPref("codeChefHandle", codeChefController.text);
                   }  else if(handleNumber==5)
                   {
                     isEnableHackerRank = ! isEnableHackerRank;
                     setSharedPref("hackerRankHandle", hackerRankController.text);

                   }  else if(handleNumber==6)
                   {
                     isEnableHackerEarth = ! isEnableHackerEarth;
                     setSharedPref("hackerEarthHandle", hackerEarthController.text);

                   }  else if(handleNumber==7)
                   {
                     isEnableKickStart= ! isEnableKickStart;
                     setSharedPref("kickStartHandle", kickStartController.text);

                   }  else if(handleNumber==8)
                   {
                     isEnableLeetCode = ! isEnableLeetCode;
                     setSharedPref("leetCodeHandle", leetCodeController.text);

                   }
                });
            },
            color: isEnabled == false ? Colors.grey:Colors.indigoAccent,
            child: isEnabled == false ? Text('Edit',style: TextStyle(
              color: Colors.white
            ),):Text('Save',style: TextStyle(
                color: Colors.white
            ),)),
      ],
    );
  }
}
