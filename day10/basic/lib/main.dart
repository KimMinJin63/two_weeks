import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Boot',
              style: GoogleFonts.lobster(fontSize: 30, color: Colors.red)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select a profile to start the Flutter Boot',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      name: 'Honlee',
                      color1: Colors.blue,
                      color2: Colors.blue.shade300,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ProfileWidget(
                      name: 'Kilee',
                      color1: Colors.yellow,
                      color2: Colors.yellow.shade200,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      name: 'Flutter Boot',
                      color1: Colors.red,
                      color2: Colors.red.shade300,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                          child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: const Icon(
                                Icons.add,
                                weight: 10,
                                size: 50,
                              )),
                        ),
                        const Text('Add profile'),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke // 채워진 원이 아니라 테두리만 있는 원을 그리기 위해 설정
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 4;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = size.width * 0.4;

    double startAngle = 0;
    double sweepAngle = 180;

    // 호의 시작점
    double startX = centerX + radius * cos(degToRad(startAngle));
    double startY = centerY + radius * sin(degToRad(startAngle));

    // 호의 끝점
    double endX = centerX + radius * cos(degToRad(startAngle + sweepAngle));
    double endY = centerY + radius * sin(degToRad(startAngle + sweepAngle));

    double controlX =
        centerX + radius * 0.5 * cos(degToRad(startAngle + sweepAngle / 2));
    double controlY =
        centerY + radius * 0.5 * sin(degToRad(startAngle + sweepAngle / 2));

    Path path = Path()
      ..moveTo(startX, startY)
      ..quadraticBezierTo(controlX, controlY, endX, endY);

    canvas.drawPath(path, paint);
  }

  double degToRad(double degrees) {
    return degrees * (pi / 180);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ProfileWidget extends StatelessWidget {
  final String name;
  final Color color1;
  final Color color2;

  const ProfileWidget({
    super.key,
    required this.name,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                CustomPaint(
                  size: const Size(70, 10),
                  painter: MyPainter(),
                )
              ],
            ),
          ),
        ),
        Text(name),
      ],
    );
  }
}
