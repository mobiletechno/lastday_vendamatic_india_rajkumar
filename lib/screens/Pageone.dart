import 'package:animated_rotation/animated_rotation.dart';
import 'package:flutter/material.dart';
import 'package:vendamatic_india_rajkumar/utils/Constants.dart';

class Pageone extends StatefulWidget {
  String getusername;
  Pageone(this.getusername);
  @override
  _PageoneState createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  int _angle = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.PAGE1),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            Text(
              Constants.WELCOME,
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            AnimatedRotation(
                angle: _angle,
                child: InkWell(
                  child: Text(widget.getusername,
                      style: TextStyle(color: Colors.red, fontSize: 40)),
                  onTap: () {
                    Rotateanimation();
                  },
                )
            )
          ]
          )
      ),
    );
  }

  void Rotateanimation() {
    setState(() {
      _angle = 720;
    });
    delay();
  }

  void delay() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _angle = -360;
      });
    });
  }
}
