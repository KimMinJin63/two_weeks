import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FlutterBoot Plus',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.bolt,
                                size: 50,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Premium features',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Plus subscribers have access to FlutterBoot+ and our latest beta features',
                                  // textAlign: TextAlign.justify,
                                  // textWidthBasis: TextWidthBasis.longestLine,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.local_fire_department,
                                size: 50,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Priority access',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'You\'ll be able to use FlutterBoot+ even when demand is high',
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.speed,
                                size: 50,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ultra_fast',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Enjoy even faster response speeds when using FlutterBoot',
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Restore subscription',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Auto-renews for \$25/month until canceled'),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: FloatingActionButton.extended(
                            onPressed: () {},
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            label: const Text(
                              'Subscribe',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {},
        //   backgroundColor: Colors.black,
        //   foregroundColor: Colors.white,
        //   label: const Text(
        //     'Subscribe',
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
