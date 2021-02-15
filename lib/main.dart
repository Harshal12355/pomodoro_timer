import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Pomodoro(),
    );
  }
}

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {

  static int TimeMinutes = 25;
  int TimeSec = TimeMinutes * 60;
  double percent = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Pomodoro Timer"),
          ),
          body: Column(
            children: <Widget>[
              SizedBox(height: 100.0,),
              Container( // this container contains three different buttons, each one will have a different timer associated with it
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          print("Pomodoro");
                        },
                        child: Text("Pomodoro"),
                    ),
                    FlatButton(
                      onPressed: () {
                        print("Short Break");
                      },
                      child: Text("Short Break"),
                    ),
                    FlatButton(
                      onPressed: () {
                        print("Long Break");
                      },
                      child: Text("Long Break"),
                    ),
                  ]
                ),
              ),
              SizedBox(),
              Container( // this will contain the circle timer
                //Cicle timer
              ),
              SizedBox(),
              Container( // this will contain the button in order to start stop the timer above in the circle
                //Button to start/stop
              ),
            ],
          ),
        ),
    );
  }
}
