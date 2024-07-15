// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: CounterDownApp(),
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({super.key});

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  Timer? repeatedFunc;
  Duration duration = Duration(seconds: 0);
  startTimer() {
    repeatedFunc = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int newSeconds = duration.inSeconds + 1;
        duration = Duration(seconds: newSeconds);
      });
    });
  }

  bool isRuning = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 81, 78, 78),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 46, 46, 46),
          title: Text(
            "Stop Watch",
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(128, 33, 31, 31),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 120,
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          duration.inHours.toString().padLeft(2, "0"),
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Hours",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 120,
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          duration.inMinutes
                              .remainder(60)
                              .toString()
                              .padLeft(2, "0"),
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Minutes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 120,
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          duration.inSeconds
                              .remainder(60)
                              .toString()
                              .padLeft(2, "0"),
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Seconds",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              isRuning
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (repeatedFunc!.isActive) {
                                repeatedFunc!.cancel();
                              } else {
                                startTimer();
                              }
                            });
                          },
                          child: Text(
                            (repeatedFunc!.isActive) ? "Stop  " : "Resume",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 244, 67, 54),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        ElevatedButton(
                          child: Text(
                            "CANCEL",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            repeatedFunc!.cancel();
                            setState(() {
                              duration = Duration(seconds: 0);
                              isRuning = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 33, 150, 243),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ) // Add some space between the text and buttons
                  : ElevatedButton(
                      child: Text(
                        "Start Timer",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        startTimer();
                        setState(() {
                          isRuning = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 33, 150, 243),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
