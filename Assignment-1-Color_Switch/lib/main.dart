import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ShapeWidget(),
    ),
  ));
}

class ShapeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShapeWidgetState();
  }
}

class _ShapeWidgetState extends State<ShapeWidget> {
  int seconds = 30;
  Timer timer;
  updateTime() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (seconds == 0) {
          timer.cancel();
          setState(() {
            isSwitchedAllowed = false;
            iconPlay = Icons.play_circle_outline;
          });
        } else
          seconds -= 1;
      });
    });
  }

  static var rng = new Random.secure();
  var isSwitchedAllowed = false;
  var min = 0, max = 7;
  var iconPlay = Icons.play_circle_outline;
  static const Random_Colors = [
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.black,
    Colors.green,
    Colors.red,
    Colors.tealAccent
  ];
  var challengeColor = Random_Colors[rng.nextInt(7)];
  final containerColor = {
    'Container-One': Colors.blue,
    'Container-Two': Colors.orange,
    'Container-Three': Colors.yellow,
    'Container-Four': Colors.black,
    'Container-Five': Colors.green,
    'Container-Six': Colors.red,
    'Container-Seven': Colors.tealAccent
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                        color: challengeColor,
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      height: 32,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Center(
                    child: Container(
                      child: Text(
                          "${seconds > 0 ? 'Seconds Left: $seconds' : 'Times Up! Game Over..'}"),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        iconPlay,
                      ),
                      iconSize: 42.0,
                      color: Colors.blue,
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        if (seconds == 30) {
                          updateTime();
                          setState(() {
                            isSwitchedAllowed = true;
                            iconPlay = Icons.pause_circle_outline;
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (isSwitchedAllowed) {
                        setState(() {
                          containerColor['Container-One'] =
                              Random_Colors[min + rng.nextInt(max - min)];
                        });
                      }
                    },
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: containerColor['Container-One'],
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (isSwitchedAllowed) {
                        setState(() {
                          containerColor['Container-Two'] =
                              Random_Colors[min + rng.nextInt(max - min)];
                        });
                      }
                    },
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: containerColor['Container-Two'],
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (isSwitchedAllowed) {
                        setState(() {
                          containerColor['Container-Three'] =
                              Random_Colors[min + rng.nextInt(max - min)];
                        });
                      }
                    },
                    child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: containerColor['Container-Three']),
                  ))
                ],
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  if (isSwitchedAllowed) {
                    setState(() {
                      containerColor['Container-Four'] =
                          Random_Colors[min + rng.nextInt(max - min)];
                    });
                  }
                },
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: containerColor['Container-Four'],
                ),
              )),
              Row(
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (isSwitchedAllowed) {
                        setState(() {
                          containerColor['Container-Five'] =
                              Random_Colors[min + rng.nextInt(max - min)];
                        });
                      }
                    },
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: containerColor['Container-Five'],
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (isSwitchedAllowed) {
                        setState(() {
                          containerColor['Container-Six'] =
                              Random_Colors[min + rng.nextInt(max - min)];
                        });
                      }
                    },
                    child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: containerColor['Container-Six']),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (isSwitchedAllowed) {
                        setState(() {
                          containerColor['Container-Seven'] =
                              Random_Colors[min + rng.nextInt(max - min)];
                        });
                      }
                    },
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      color: containerColor['Container-Seven'],
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//flutter Outline
