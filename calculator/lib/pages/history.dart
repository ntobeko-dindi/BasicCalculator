import 'package:calculator/constants/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String history = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      history = prefs.getString('history');
    });
  }

  void clearHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('history');

    setState(() {
      getData();
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: history != null
            ? Text(
                '' + history,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: AppColours.white,
                ),
              )
            : Center(
                child: Text(
                  'no history to display',
                  style: TextStyle(
                    color: AppColours.white,
                    fontSize: 22.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColours.red,
        child: Icon(Icons.delete_forever),
        onPressed: () {
          clearHistory();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
