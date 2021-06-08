import 'package:calculator/constants/app_colours.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: AppBar(
        backgroundColor: AppColours.grey,
        title: Text("History"),
        centerTitle: true,
        leading: InkWell(
          child: Container(
            color: AppColours.black,
            padding: EdgeInsets.only(right: 200),
            child: IconButton(
              icon: Icon(Icons.close),
              iconSize: 35,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Text("no history to display"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColours.orange,
        child: Icon(Icons.delete_forever),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
