/*
A simple calculator app in Flutter's dart language that takes two inputs and can do one of the four
main arithmetic functions.

Homework 1

Based on the Flutter calculator CrashCourse found @https://youtu.be/Ss1HkZ3LnRY,
*/



import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  var initNum=0, initNum2=0, sum=0;
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  //calculator functions
  void Add() {
    setState(() {
      initNum = int.parse(t1.text); 
      initNum2 = int.parse(t2.text); 
      sum = initNum + initNum2;
    });
  }
  void Subtract() {
    setState(() {
      initNum = int.parse(t1.text); 
      initNum2 = int.parse(t2.text); 
      sum = initNum - initNum2;
    });
  }
  void Multiply() {
    setState(() {
      initNum = int.parse(t1.text); 
      initNum2 = int.parse(t2.text); 
      sum = initNum * initNum2;
    });
  }
  void Divide() {
    setState(() {
      initNum = int.parse(t1.text); 
      initNum2 = int.parse(t2.text); 
      sum = initNum ~/ initNum2;//interesting that there is a specific op for int truncation 
    });
  }

  void Clear() {
    setState(() {
      // initNum = 0;
      // initNum2 = 0;
      t1.text = "0";
      t2.text = "0";
    });
  }




  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar( 
        title: new Text("Calculator"),

      ),
      body: new Container(
        padding: const EdgeInsets.all(50.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Output: $sum",
              style: new TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent),
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter first number"),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter second number"),
              controller: t2,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.lightGreenAccent,
                  onPressed: Add,
                  ),
                new MaterialButton(
                  child: new Text("-"),
                  color: Colors.lightGreenAccent,
                  onPressed: Subtract,
                  ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("x"),
                  color: Colors.lightGreenAccent,
                  onPressed: Multiply,
                  ),
                new MaterialButton(
                  child: new Text("/"),
                  color: Colors.lightGreenAccent,
                  onPressed: Divide,
                  ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 25.0),
            ),
            new Row(
              //center align the clear button
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Clear"),
                  color: Colors.lightGreenAccent,
                  onPressed: Clear,
                  ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
