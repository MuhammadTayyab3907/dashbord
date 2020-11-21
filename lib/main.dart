import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridLayout(),
  ));
}

class GridLayout extends StatelessWidget {
  List<String> events = [
    "Calendar",
    "Family",
    "Friend",
    "Lovely",
    "Me",
    "Team"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 120.0),
        child: GridView(
          physics: BouncingScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: events.map((title) {
            return GestureDetector(
              child: Card(
                margin: EdgeInsets.all(20.0),
                child: getCardWithTile(title),
              ),
              onTap: () {
                Fluttertoast.showToast(
                    msg: title + " click",
                    textColor: Colors.white,
                    backgroundColor: Colors.red,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    fontSize: 16.0);
              },
            );
          }).toList(),
        ),
      ),
    ));
  }

  Column getCardWithTile(String title) {
    String img = "";
    if (title == "Calendar")
      img = "assets/calendar.png";
    else if (title == "Family")
      img = "assets/family_time.png";
    else if (title == "Friend")
      img = "assets/friends.png";
    else if (title == "Lovely")
      img = "assets/lovely_time.png";
    else if (title == "Me")
      img = "assets/me_time.png";
    else
      img = "assets/team_time.png";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  img,
                  width: 80.0,
                  height: 80,
                )
              ],
            ),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
