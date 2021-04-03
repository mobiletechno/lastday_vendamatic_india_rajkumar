import 'package:animated_rotation/animated_rotation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Pagethree extends StatefulWidget {
  String getusername;




  @override
  _PagethreeState createState() => _PagethreeState();
}

class _PagethreeState extends State<Pagethree> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page three"),

        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MaterialButton(
              onPressed: () {

              },
              elevation: 20,
              child: Text('Calculate'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            MaterialButton(
              elevation: 20,
              onPressed: () {

              },
              child: Text('Getimage'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }



}
