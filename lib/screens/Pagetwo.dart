import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:vendamatic_india_rajkumar/utils/Constants.dart';

/// This is the stateful widget that the main application instantiates.
class Pagetwo extends StatefulWidget {
  @override
  _PagetwoState createState() => _PagetwoState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PagetwoState extends State<Pagetwo> {
  double width = 100.0, height = 50.0;
  Offset position;

  double widthbt2 = 100.0, heightbt2 = 50.0;
  Offset positionbt2;

  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectionsubscribtion;

  @override
  void initState() {
    super.initState();
    position = Offset(40.0, height - 20);
    positionbt2 = Offset(250.0, heightbt2 - 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page two"),
          centerTitle: true,
        ),
        body: Center(
            child: Stack(
          children: <Widget>[
            Positioned(
              left: position.dx,
              top: position.dy - height + 30,
              child: Draggable(
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.blue,
                  child: Center(
                    child: InkWell(
                      child: Text(Constants.NETWORK,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onTap: () {
                        Checkconnection();
                      },
                    ),
                  ),
                ),
                feedback: Container(
                  child: Center(
                    child: Text(
                      Constants.NETWORK,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                  color: Colors.red[800],
                  width: width,
                  height: height,
                ),
                onDraggableCanceled: (Velocity velocity, Offset offset) {
                  setState(() => position = offset);
                },
              ),
            ),
            Positioned(
              left: positionbt2.dx,
              top: positionbt2.dy - heightbt2 + 30,
              child: Draggable(
                child: Container(
                  width: widthbt2,
                  height: heightbt2,
                  color: Colors.blue,
                  child: Center(
                    child: InkWell(
                      child: Text(Constants.GPS,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onTap: () {
                        checklocation();
                      },
                    ),
                  ),
                ),
                feedback: Container(
                  child: Center(
                    child: Text(
                      Constants.GPS,
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ),
                  color: Colors.red[800],
                  width: widthbt2,
                  height: heightbt2,
                ),
                onDraggableCanceled: (Velocity velocity, Offset offset) {
                  setState(() => positionbt2 = offset);
                },
              ),
            ),
          ],
        )));
  }

  void Checkconnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Fluttertoast.showToast(
          msg: Constants.NOTCONNECT,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (result == ConnectivityResult.mobile) {
      Fluttertoast.showToast(
          msg: Constants.MOBILEDATA,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (result == ConnectivityResult.wifi) {
      Fluttertoast.showToast(
          msg: Constants.WIFI,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> checklocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    } else {
      Fluttertoast.showToast(
          msg: Constants.ONGPS,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    } else {
      Fluttertoast.showToast(
          msg: Constants.ONGPS,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    _locationData = await location.getLocation();
  }
}
