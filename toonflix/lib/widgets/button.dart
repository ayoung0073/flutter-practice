// 클래스 직접 만드는 것에 익숙해지기 까지

import 'package:flutter/material.dart';

// Reusable Button Widget
// 모든 위젯은 각자 나름대로의 build 메서드를 실행시켜야 한다.
// 요청 데이터: 텍스트, 배경 색상, 텍스트 색상
class Button extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(40)),
      child: Padding(
        // 이제 text값에 따라 달라지기 때문에 const를 생략해줘야 함. (커스터마이징)
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 22),
        ),
      ),
    );
  }
}
