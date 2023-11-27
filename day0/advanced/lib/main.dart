import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int squareScore = 0;
  int circleScore = 0;
  Random random = Random();
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          title: const Text('Hello Draggable!'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2)),
                        child: Center(
                          child: DragTarget(
                            onAccept: (data) {
                              if (data == 'square') {
                                setState(() {
                                  squareScore += 1;
                                });
                              }
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Text('$squareScore');
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            border: Border.all(width: 2)),
                        child: Center(
                          child: DragTarget(
                            onAccept: (data) {
                              if (data == 'circle') {
                                setState(() {
                                  circleScore += 1;
                                });
                              }
                            },
                            builder: (context, candidateData, rejectedData) {
                              return Text('$circleScore');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 180,
                  ),
                  Draggable(
                      data: getRandomShape(),
                      feedback: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(width: 1),
                        ),
                        child: const Center(
                            child: Material(
                                color: Colors.transparent,
                                child: Text('Drag Me!'))),
                      ),
                      childWhenDragging: const SizedBox(
                        height: 80,
                        width: 80,
                      ),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(width: 1),
                        ),
                        child: const Center(child: Text('Drag Me!')),
                      )
                      //  onDraggableCanceled: (Velocity velocity, Offset offset) {
                      //   // Allow Draggable to be dragged again after being dropped
                      //   // Reset the state if needed
                      //   setState(() {});}
                      ),
                  Draggable(
                      data: getRandomShape(),
                      feedback: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1),
                        ),
                        child: const Center(
                            child: Material(
                                color: Colors.transparent,
                                child: Text('Drag Me!'))),
                      ),
                      childWhenDragging: const SizedBox(
                        height: 80,
                        width: 80,
                      ),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1),
                        ),
                        child: const Center(child: Text('Drag Me!')),
                      )
                      //  onDraggableCanceled: (Velocity velocity, Offset offset) {
                      //   // Allow Draggable to be dragged again after being dropped
                      //   // Reset the state if needed
                      //   setState(() {});}
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
    String getRandomShape() {
    // 'circle' 또는 'square'를 랜덤으로 선택
    return random.nextBool() ? 'circle' : 'square';
  }
}
