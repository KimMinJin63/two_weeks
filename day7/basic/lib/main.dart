import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: OverlayManager(child: const MyApp()),
    ),
  );
}


class OverlayManager extends StatefulWidget {
  final Widget child;

  const OverlayManager({Key? key, required this.child}) : super(key: key);

  static OverlayManagerState? of(BuildContext context) {
    return context.findAncestorStateOfType<OverlayManagerState>();
  }

  @override
  OverlayManagerState createState() => OverlayManagerState();
}

class OverlayManagerState extends State<OverlayManager> {
  OverlayEntry? _overlayEntry;

  void _removeOverlayEntry() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void toggleOverlay(BuildContext context, int buttonIndex) {
    // 기존 오버레이가 있다면 제거
    _removeOverlayEntry();

    final RenderBox buttonRenderBox = context.findRenderObject() as RenderBox;
    final Offset buttonPosition = buttonRenderBox.localToGlobal(Offset.zero);

    double topPosition;

    if (buttonIndex == 0) {
      topPosition = buttonPosition.dy + 150;
    } else if (buttonIndex == 1) {
      topPosition = buttonPosition.dy + 200;
    } else if (buttonIndex == 2) {
      topPosition = buttonPosition.dy + 250;
    } else if (buttonIndex == 3) {
      topPosition = buttonPosition.dy + 300;
    } else {
      // 기본값 설정
      topPosition = buttonPosition.dy + 150;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: topPosition,
          left: buttonPosition.dx + 150,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
  onTap: () {
    print('오버레이 탭');
  },
 behavior: HitTestBehavior.translucent,  // 오버레이 위의 영역에서 발생한 터치 이벤트 무시
  child: Center(
    child: Container(
      width: 180,
      height: 40,
      color: Colors.grey,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_downward_sharp),
            Text(
              'You clicked this! $buttonIndex',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    // 새로운 오버레이를 추가
    Overlay.of(context)!.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _removeOverlayEntry(); // Dismiss overlay on tap outside
      },
      child: widget.child,
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Overlay'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 40),
              ),
              onPressed: () {
                print('버튼 눌림');
                OverlayManager.of(context)?.toggleOverlay(context, 0);
              },
              child: const Text(
                'Hello!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 40),
              ),
              onPressed: () {
                OverlayManager.of(context)?.toggleOverlay(context, 1);
              },
              child: const Text('Press',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 40),
              ),
              onPressed: () {
                OverlayManager.of(context)?.toggleOverlay(context, 2);
              },
              child: const Text('any',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 40),
              ),
              onPressed: () {
                OverlayManager.of(context)?.toggleOverlay(context, 3);
              },
              child: const Text('button!',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
