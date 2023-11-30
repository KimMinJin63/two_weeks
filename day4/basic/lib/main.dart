import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController1 =
      TextEditingController(text: 'Hello');
  TextEditingController textEditingController2 =
      TextEditingController(text: 'FlutterBoot!');
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello TextField!'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.backspace) {
                // Backspace key is pressed, move focus to the previous or next field based on conditions
                _handleBackspace();
              }
            },
            child: Column(
              children: [
                TextField(
                  controller: textEditingController1,
                  focusNode: focusNode1,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    _moveFocusToNextField(focusNode2);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: textEditingController2,
                  focusNode: focusNode2,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    _moveFocusToNextField(focusNode1);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleBackspace() {
    if (textEditingController1.text.isEmpty && focusNode1.hasFocus) {
      _moveFocusToPreviousField();
    } else if (textEditingController2.text.isEmpty && focusNode2.hasFocus) {
      _moveFocusToPreviousField();
    } else {
      // If the current field is not empty, handle backspace normally
      final currentController =
          focusNode1.hasFocus ? textEditingController1 : textEditingController2;
      final currentText = currentController.text;
      final selection = currentController.selection;
      if (selection.start == selection.end && selection.start > 0) {
        // Delete the character before the cursor
        final newText = currentText.substring(0, selection.start - 1) +
            currentText.substring(selection.end);
        currentController.text = newText;
        currentController.selection =
            TextSelection.collapsed(offset: selection.start - 1);
      } else if (selection.start == 0 && selection.end == 0) {
        // If cursor is at the beginning and there's no selection, move focus to previous field
        _moveFocusToPreviousField();
      }
    }
  }

  void _moveFocusToNextField(FocusNode nextFocusNode) {
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  void _moveFocusToPreviousField() {
    FocusScope.of(context)
        .requestFocus(focusNode1.hasFocus ? focusNode2 : focusNode1);
  }
}
