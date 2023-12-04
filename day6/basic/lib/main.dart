import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numbers = 0;
  int numbers2 = 0;
  int numbers3 = 0;
  int selectNum = 0;
  int? selectedButton;

  @override
  Widget build(BuildContext context) {
    switch (selectedButton) {
      case 1:
        selectNum = numbers;
        break;
      case 2:
        selectNum = numbers2;
        break;
      case 3:
        selectNum = numbers3;
        break;
      default:
        selectNum = 0;
    }

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your point  : $selectNum',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: ((BuildContext context) {
                      int newNumber = getRandomInteger();
                      int newNumber2 = getRandomInteger();
                      int newNumber3 = getRandomInteger();
                      return AlertDialog(
                        title: const Text(
                          'Choose your next point!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        content: const Text(
                          'Choose one of the points below!\nIf you don\'t make a selection, your current score will be retained.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedButton = 1;
                                numbers = newNumber;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text(newNumber.toString()),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedButton = 2;
                                numbers2 = newNumber2;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text(newNumber2.toString()),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedButton = 3;
                                numbers3 = newNumber3;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text(newNumber3.toString()),
                          ),
                        ],
                      );
                    }),
                  );
                },
                child: const Text(
                  'I want more points!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int getRandomInteger() {
    final random = Random();
    return random.nextInt(100);
  }
}
