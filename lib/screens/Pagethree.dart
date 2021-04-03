import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:vendamatic_india_rajkumar/utils/Constants.dart';

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
        title: Text(Constants.PAGE3),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        shrinkWrap: true,

        childAspectRatio: 1.0,
        mainAxisSpacing: 2.0,
        crossAxisSpacing: 2.0,

        scrollDirection: Axis.horizontal,
        crossAxisCount: 6,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Center(
            child: new InkWell(
              onTap: () => Opendialog(context, index),
              child: new Container(
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  border: new Border.all(color: Colors.black, width: 2.0),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: new Center(
                  child: new Text(
                    'Table $index',
                    style: new TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ),
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
              child: Container(
                  height: 180,
                  child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('TABLE $index',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)),
                            Table(
                              defaultColumnWidth: FixedColumnWidth(100.0),
                              border: TableBorder.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2),
                              children: [
                                TableRow(children: [
                                  Column(children: [
                                    Text(Constants.SERIALNO,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Column(children: [
                                    Text(Constants.BOOKNAME,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                  Column(children: [
                                    Text(Constants.CATEGORY,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('100$index')]),
                                  Column(children: [Text('Java $index')]),
                                  Column(children: [Text('Code $index')]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('101$index')]),
                                  Column(children: [Text('Algebra $index')]),
                                  Column(children: [Text('Maths $index')]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('102$index')]),
                                  Column(children: [Text('Football $index')]),
                                  Column(children: [Text('Sports $index')]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('103$index')]),
                                  Column(children: [Text('jackie $index')]),
                                  Column(children: [Text('cinema $index')]),
                                ]),
                                TableRow(children: [
                                  Column(children: [Text('104$index')]),
                                  Column(children: [Text('atomic $index')]),
                                  Column(children: [Text('physics $index')]),
                                ]),
                              ],
                            ),
                          ]))));
        });
  }
}
