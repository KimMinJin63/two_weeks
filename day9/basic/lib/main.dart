import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController controller = PageController();
  late List<String> imageUrls;
  int currentIndex = 0;
  bool isLoading = true;

  String getRandomImageSrc() {
    return 'https://picsum.photos/id/${Random().nextInt(1000) + 1}/200/200';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
   title: Text('Click left and right'),        ),
        body: PageView.builder(
          controller: controller,
          itemCount: getRandomImageSrc().length, // 이미지의 총 개수에 해당하는 고정값이나 변수 사용
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                        },
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.network(
                    getRandomImageSrc(),
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        // 이미지 로딩 성공
                        isLoading = false;
                        return child;
                      } else if (loadingProgress != null) {
                        // 이미지 로딩 중
                        isLoading = true;
                        print('로딩 중...');
                        return const Center(child: Text('Loading...'));
                      } 
                      else {
                        // 이미지 로딩 실패
                        isLoading = false;
                        return const Center(
                          child: Icon(Icons.error),
                        );
                      }
                    },
                  ),
                ),
                // if (!isLoading) Text('로딩 중...'),
              ],
            );
          },
        ),
      ),
    );
  }
}
