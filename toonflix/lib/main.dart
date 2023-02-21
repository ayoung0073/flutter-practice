import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() =>
      _MyWidgetState(); // 위젯 그자체, 애플리케이션 클래스로 확장된다.
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0;

  void onClicked() {
    // setState(): State 클래스에게 데이터가 변경되었다고 알리는 함수다. => build 메서드를 다시 실행하도록 한다.
    // 이 메서드를 호출하지 않으면 build 메서드는 다시 실행되지 않는다.
    setState(() {
      counter = counter + 1;
    });

    // counter = counter + 1;
    // setState(() {});
    // 이렇게도 가능하지만, 가독성을 위해 안으로 넣는 것이 좋다.
  }

  @override
  Widget build(BuildContext context) {
    // 데이터가 변경될 때 위젯도 함께 스스로 업데이트된다.
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              IconButton(
                  iconSize: 40,
                  onPressed: onClicked,
                  icon: const Icon(
                    Icons.add_box_rounded,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
