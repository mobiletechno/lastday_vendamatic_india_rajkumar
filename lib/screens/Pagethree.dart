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
        title: Text('Page three'),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        scrollDirection: Axis.horizontal,
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(

              child: InkWell(
                child: Text("Table $index",
                    style: TextStyle(color: Color((math.Random().nextDouble() *
                        0xFFFFFF).toInt()).withOpacity(1.0), fontSize: 40)),
                onTap: () {
                  Opendialog(context, index);
                },
              )
          );
        }),
      ),
    );
  }

  void Opendialog(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)), //this right here
              child:Container(
                  height: 150,
                  child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Text('Table $index',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black)),
                            Table(
                              defaultColumnWidth: FixedColumnWidth(100.0),


                              border: TableBorder.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2),
                              children: [
                                TableRow( children: [
                                  Column(children:[Text('Serial No', style: TextStyle(fontSize: 15.0))]),
                                  Column(children:[Text('Book Name', style: TextStyle(fontSize: 15.0))]),
                                  Column(children:[Text('Category', style: TextStyle(fontSize: 15.0))]),
                                ]),
                                TableRow( children: [
                                  Column(children:[Text('100$index')]),
                                  Column(children:[Text('Java $index')]),
                                  Column(children:[Text('Code $index')]),
                                ]),
                                TableRow( children: [
                                  Column(children:[Text('101$index' )]),
                                  Column(children:[Text('Algebra $index')]),
                                  Column(children:[Text('Maths $index')]),
                                ]),
                                TableRow( children: [
                                  Column(children:[Text('102$index')]),
                                  Column(children:[Text('Football $index')]),
                                  Column(children:[Text('Sports $index')]),
                                ]),
                              ],
                            ),

                          ])
                  )
              )
          );
        });
  }


}// TODO Implement this library.