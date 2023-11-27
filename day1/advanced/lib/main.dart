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
  TextEditingController controller = TextEditingController();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: -8,
          foregroundColor: Colors.black,
          leading: const Icon(Icons.sort),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.edit),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: RichText(
            text: const TextSpan(children: [
              TextSpan(
                text: 'MyCuteGPT',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: ' 3.5',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 15,
                    child: Text('G', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('MyCuteGPT'),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            'Hello, How can I help you?',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessageItem(messages[index]);
              },
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    minLines: 1,
                    maxLines: 10,
                    controller: controller,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      filled: true,
                      hintText: 'Message',
                      fillColor: Colors.grey.shade300,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: controller.text.isEmpty
                          ? const Icon(Icons.graphic_eq)
                          : null,
                      suffixIconColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    sendMessage();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade300,
                    ),
                    child: const Icon(Icons.arrow_upward),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMessageItem(String message) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.purple,
                child: Text(
                  'FC',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('FlutterBoot'),
                const SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 15,
                child: Text('G',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MyCuteGPT'),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Actually, I don\'t have any features, but one day I\'ll grow up and become ChatGPT!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      setState(() {
        messages.add(controller.text);
        controller.clear();
      });
    }
  }
}
