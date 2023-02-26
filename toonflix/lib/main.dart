import 'package:flutter/material.dart';
import 'package:toonflix/screens/webtoon_home_screen.dart';
import 'package:toonflix/services/webtoon_api_service.dart';

void main() {
  ApiService().getTodayToons();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
