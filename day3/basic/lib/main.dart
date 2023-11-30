import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appbar = AppBar(
          title: const Text('I can layout this'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.black,
          elevation: 0,
        );

    return MaterialApp(
      home: Scaffold(
        appBar: appbar,
        body: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2,
              decoration: const BoxDecoration(
                color: Colors.grey,
                border: Border(right: BorderSide(width: 5))
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height/2 - appbar.preferredSize.height,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
