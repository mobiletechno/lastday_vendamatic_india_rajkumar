
import 'package:flutter/material.dart';
import 'dart:math' as math;
// import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';




class Pagefour extends StatefulWidget {




  @override
  _PagefourState createState() => _PagefourState();
}

class _PagefourState extends State<Pagefour> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page four"),

        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                int sum=50000*50000;
                Fluttertoast.showToast(
                    msg: "50000*50000=$sum",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                // Toast.show("50000*50000=$sum", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              },
              elevation: 20,
              child: Text('Calculate'),
              color: Colors.blue,
              textColor: Colors.white,
            ),
            MaterialButton(
              elevation: 20,
              onPressed: () {
                Opendialog(context);
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
                child : Column(

                  crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'close dialog',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    Container(
                      width: 120,
                    height: 120,

                    child :Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/vendomatic-88c12.appspot.com/o/images%2Fnature.jpg?alt=media&token=12ee3055-f6a8-4153-a87d-dbaff730ac08',
                    )),
                Container(
                  width: 120,
                  height: 120,
                  child :Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/vendomatic-88c12.appspot.com/o/images%2Fnature-hd-background-22.jpg?alt=media&token=f15cded9-9d1f-472f-8986-1b91deb9a44e',
                    ))


                  ],
                ),
                ],
              ),
            ),
          ),
          );
        });

  }
}
