import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'Short_Break.dart';
import 'Long_Break.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro Timer',
      debugShowCheckedModeBanner: false,
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
  CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[700],
          appBar: AppBar(
            title: Center(
                child: Text("Pomodoro Timer")
            ),
            backgroundColor: Colors.red[900],
          ),
          body: Column(
            children: <Widget>[
              SizedBox(height: 100.0,),
              Container( // this container contains three different buttons, each one will have a different timer associated with it
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SPage()),
                        );
                      },
                      child: Text(
                          "Short Break",
                          style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LPage()),
                        );
                      },
                      child: Text(
                          "Long Break",
                          style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black,
                    ),
                  ]
                ),
              ),
              SizedBox(),
              Container( // this will contain the circle timer
                child: Center(
                  child: CircularCountDownTimer(
                    // Countdown duration in Seconds.
                    duration: TimeSec,

                    // Countdown initial elapsed Duration in Seconds.
                    initialDuration: 0,

                    // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                    controller: _controller,

                    // Width of the Countdown Widget.
                    width: MediaQuery.of(context).size.width / 2,

                    // Height of the Countdown Widget.
                    height: MediaQuery.of(context).size.height / 2,

                    // Ring Color for Countdown Widget.
                    ringColor: Colors.grey[300],

                    // // Ring Gradient for Countdown Widget.
                    // ringGradient: null,

                    // Filling Color for Countdown Widget.
                    fillColor: Colors.grey[900],

                    // Filling Gradient for Countdown Widget.
                    fillGradient: null,

                    // Background Color for Countdown Widget.
                    backgroundColor: Colors.grey,

                    // Border Thickness of the Countdown Ring.
                    strokeWidth: 10.0,

                    // Begin and end contours with a flat edge and no extension.
                    strokeCap: StrokeCap.round,

                    // Text Style for Countdown Text.
                    textStyle: TextStyle(
                        fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),

                    // Format for the Countdown Text.
                    textFormat: CountdownTextFormat.S,

                    // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                    isReverse: false,

                    // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                    isReverseAnimation: false,

                    // Handles visibility of the Countdown Text.
                    isTimerTextShown: true,

                    // Handles the timer start.
                    autoStart: false,

                    // This Callback will execute when the Countdown Starts.
                    onStart: () {
                      // Here, do whatever you want
                      print('Countdown Started');
                    },

                    // This Callback will execute when the Countdown Ends.
                    onComplete: () {
                      // Here, do whatever you want
                      print('Countdown Ended');
                    },
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _button(title: "Start", onPressed: () => _controller.start()),
                    _button(title: "Pause", onPressed: () => _controller.pause()),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _button(title: "Resume", onPressed: () => _controller.resume()),
                    _button(title: "Restart", onPressed: () => _controller.restart(duration: TimeSec))
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

_button({String title, VoidCallback onPressed}) {
  return RaisedButton(
    child: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    onPressed: onPressed,
    color: Colors.black,
  );
}
