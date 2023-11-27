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
  int score = 0;
  void plusScore(){
    setState(() {
      score +=1;
    });
  }
  void minusScore(){
    setState(() {
      score -=1;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          title: const Text('Hello Flutter'),
          leading: const Icon(Icons.home),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.help),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Your score',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              const SizedBox(
                height: 20,
              ),
              Text('$score',
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 35)),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade800,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: plusScore,
                      child: const Icon(Icons.add)),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade800,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: minusScore,
                      child: const Icon(Icons.remove)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
