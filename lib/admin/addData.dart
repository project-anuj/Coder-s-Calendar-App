import 'package:coders_calendar/firebase/firebase_service.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _topicController = TextEditingController();
  TextEditingController _tipsTitleController = TextEditingController();
  TextEditingController _tipsDescController = TextEditingController();
  TextEditingController _tipsLinkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Add Data'),),
        body: Padding(
          padding: const EdgeInsets.only(top: 20,left: 8,right: 8,bottom: 4),
          child: Form(
            key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val){
                        if(val==null || val.isEmpty){
                          return "Please enter title";
                        }
                        return null;
                      },
                      controller: _topicController,
                      decoration: InputDecoration(
                        labelText: 'Enter the topic name',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator: (val){
                        if(val==null || val.isEmpty){
                          return "Please enter title";
                        }
                        return null;
                      },
                      controller: _tipsTitleController,
                      decoration: InputDecoration(
                        labelText: 'Enter the tips title',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _tipsDescController,
                      decoration: InputDecoration(
                        labelText: 'Enter the tips Description',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _tipsLinkController,
                      decoration: InputDecoration(
                        labelText: 'Enter the tips Link',
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseService().addTopic(_topicController.text);
                        FirebaseService().addTips(
                          context,
                            _topicController.text,
                            _tipsTitleController.text,
                            _tipsDescController.text,
                            _tipsLinkController.text);

                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
