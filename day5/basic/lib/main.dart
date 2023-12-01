import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final spaceData = {
      'NGC 162': 1862,
      '87 Sylvia': 1866,
      'R 136a1': 1985,
      '28978 Ixion': 2001,
      'NGC 6715': 1778,
      '94400 Hongdaeyong': 2001,
      '6354 Vangelis': 1934,
      'C/2020 F3': 2020,
      'Cartwheel Galaxy': 1941,
      'Sculptor Dwarf Elliptical Galaxy': 1937,
      'Eight-Burst Nebula': 1835,
      'Rhea': 1672,
      'C/1702 H1': 1702,
      'Messier 5': 1702,
      'Messier 50': 1711,
      'Cassiopeia A': 1680,
      'Great Comet of 1680': 1680,
      'Butterfly Cluster': 1654,
      'Triangulum Galaxy': 1654,
      'Comet of 1729': 1729,
      'Omega Nebula': 1745,
      'Eagle Nebula': 1745,
      'Small Sagittarius Star Cloud': 1764,
      'Dumbbell Nebula': 1764,
      '54509 YORP': 2000,
      'Dia': 2000,
      '63145 Choemuseon': 2000,
    };
    for (int i = 0; i < spaceData.keys.length; i++) {
      print(spaceData[spaceData.keys.toList()[i]]);
    }
 var scrollController = ScrollController();

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First ListView!'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: spaceData.keys.map((key) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(Icons.satellite_alt),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Text('$key was discovered in ${spaceData[key]}'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Use the scroll controller to scroll to the top
            scrollController.animateTo(
              0,
              duration: Duration(seconds: 2),
              curve: Curves.linearToEaseOut,
            );
          },
          child: Icon(Icons.navigation),
        ),
      ),
    );
  }}
