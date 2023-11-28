import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int score = 0;
  double progress = 0.0;
  bool isFillingGauge = false;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text(
            'Your Score',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
                child: Text('$score',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                    ),
                    height: 400,
                    width: 50,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: LinearProgressIndicator(
                        value: progress,
                        valueColor: const AlwaysStoppedAnimation(Colors.purple),
                        backgroundColor: Colors.grey[300],
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 24),
                  child: GestureDetector(
                    onTapDown: (_) {
                      print('onTapDown');
                      setState(() {
                        if (!isFillingGauge) {
                          startFillingGauge();
                        } else {
                          // 버튼을 누르지 않았을 때만 주기적으로 게이지를 감소시킴
                          timer.cancel();
                          isFillingGauge = false;
                        }
                      });
                    },
                    onTapUp: (_) {
                      print('onTapUp');
                      setState(() {
                        if (isFillingGauge) {
                          timer.cancel();
                          isFillingGauge = false;
                          // 버튼에서 손을 땠을 때 감소시킴
                          decreaseGauge();
                        }
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.add,
                        weight: 50,
                        size: 30,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void startFillingGauge() {
    const duration = Duration(milliseconds: 25);
    const int maxScore = 100;
    const double decreaseAmount = 0.05;
    const double increaseAmount = 0.2;

    setState(() {
      isFillingGauge = true;
    });

    timer = Timer.periodic(duration, (timer) {
      if (!isFillingGauge) {
        // 버튼을 누르지 않았을 때만 주기적으로 게이지를 감소시킴
        setState(() {
          progress = (progress - decreaseAmount).clamp(0.0, 1.0);
          print('줄어듦');
        });

        if (progress <= 0.0) {
          timer.cancel();
          setState(() {
            score = 0;
          });
          print('초기화');
        }
      } else {
        setState(() {
          progress = (progress + increaseAmount).clamp(0.0, 1.0);
          print('증가');
        });

        if (progress >= 0.9) {
          timer.cancel();
          setState(() {
            // progress = 0;
            score = (score + 1) % maxScore;
            isFillingGauge = false;
          });
          print('점수 올라가고 초기화');
        }
      }
    });
  }

  void decreaseGauge() {
    const double decreaseAmount = 0.005;

    Timer.periodic(Duration(milliseconds: 5), (timer) {
      setState(() {
        progress = (progress - decreaseAmount).clamp(0.0, 1.0);
        print('감소');
      });

      if (progress <= 0.0) {
        timer.cancel();
        setState(() {
          score = 0;
        });
        print('초기화');
      }
    });
  }
}
