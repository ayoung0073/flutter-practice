import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {
  runApp(App());
  // runApp은 하나의 argument(Widget 타입)를 필요로 한다.
  // 여러 Widget들이 합쳐서 UI를 만드는 방식
}

// 하나의 Widget => 하나의 class
// class를 Widget으로 만들기 위해 flutter SDK에 있는 3개의 core Widget 중에 하나를 extend(상속) 받아야 한다.
// 1. StatelessWidget: 화면에 무언가 띄어주는 역할만을 한다.
// 2.
// 3.

// 앱의 root Widget.
// 모든 화면과 버튼 등등 모든 것들이 App Widget으로부터 온다.
class App extends StatelessWidget {
  const App({super.key});

  // Widget을 return 하는 build 메서드
  @override
  Widget build(BuildContext context) {
    // BuildContext는 나중에 공부!
    // 앱의 root Widget은 2개의 옵션 중 하나를 return 해야한다.
    // 1. MaterialApp 을 return [구글 디자인 시스템] - 얘가 훨씬 남
    // 2. CupertinoApp 앱을 return [애플 디자인 시스템]
    // 이는 우리가 어떤 family 스타일을 사용할지 flutter에게 알리는 역할을 한다.
    return MaterialApp(
        home: Scaffold(
            // home: 우리 앱의 home에 있을 때 보여진다.
            backgroundColor: const Color(0xFF181818),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // 하나의 Row(수평 방향)에서 가장 끝으로
                    children: [
                      const SizedBox(
                        // Total Balance 텍스트 위의 공간을 만들어준다.
                        // SizedBox를 이용해서 공간을 만든다.
                        height: 130,
                      ),
                      // Total Balance 텍스트 위의 공간을 만들어준다.
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("Hey, Jenny",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800)),
                          Text(
                            "Welcome back",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Total Balance",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 22),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "\$ 5 197 184",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 43,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    // Container Widget
                    // div. child를 갖고 있는 div
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(40)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: Text(
                            "Transfer",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}

// flutter 개발에 있는 규칙: 화면이 scaffold라고 하는 걸 가져가야 한다.
// scaffold: 우리 화면의 구성 및 구조에 관한 것을 가지고 있는 Widget ex) Top Bar, App의 body
