import 'package:flutter/material.dart';
// import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendamatic_india_rajkumar/screens/Pagefour.dart';

import 'package:vendamatic_india_rajkumar/screens/Pageone.dart';
import 'package:vendamatic_india_rajkumar/screens/Pagethree.dart';
import 'package:vendamatic_india_rajkumar/screens/Pagetwo.dart';

class Home extends StatelessWidget {
  TextEditingController usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
            title: Text('RajKumar Flutter Demo'),
            automaticallyImplyLeading: false),
        body: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Container(
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  //remove color to make it transpatent
                                ),
                                child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          MaterialButton(
                                            onPressed: () {
                                              Opendialog(context);
                                            },
                                            elevation: 20,
                                            child: Text('Button 1'),
                                            color: Colors.red,
                                            textColor: Colors.white,
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Pagetwo()));
                                            },
                                            elevation: 20,
                                            child: Text('Button 2'),
                                            color: Colors.red,
                                            textColor: Colors.white,
                                          ),
                                        ])),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    //remove color to make it transpatent
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        color: Colors.red)),
                                child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Pagethree()));
                                            },
                                            elevation: 20,
                                            child: Text('Button 3'),
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Pagefour()));
                                            },
                                            elevation: 20,
                                            child: Text('Button 4'),
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            )
                          ],
                        )
                    )
                ),
              ],
            )
        )
    );
  }

  void Opendialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green)),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your name'),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          String getusername= usernameController.text;
                          Validateusername(getusername,context);

                        },
                        child: Text(
                          "Okay",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void Validateusername(String getusername, BuildContext context) {
    if(getusername.length<3 && !getusername.isEmpty)
      Fluttertoast.showToast(
          msg: "User name should be greater than 3",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // Toast.show("User name should be greater than 3", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
    else if(getusername.isEmpty)
      Fluttertoast.showToast(
          msg: "enter the name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      // Toast.show("enter the name", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    else{
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Pageone(getusername)));
    }



  }
}
