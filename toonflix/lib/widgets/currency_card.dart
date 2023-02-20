import 'package:flutter/material.dart';

// 가변 데이터: 통화 이름, 통화 코드, 통화량, 통화 아이콘
class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  // 앞에 언더바를 붙이는 건, private 하게 만들겠다는 선언이다.
  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 어떤 아이템이 overflow 되었을 때 Container로 하여금 어떻게 동작할 건지 설정
      clipBehavior: Clip.hardEdge, // hardEdge: 나머지 부분을 잘라낸다.
      // Container의 decoration 기능!
      decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: isInverted ? _blackColor : Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    code,
                    style: TextStyle(
                      color: isInverted
                          ? _blackColor
                          : Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
          Transform.translate(
            // 아이콘 이동시키기
            offset: const Offset(-5, 20),
            child: Transform.scale(
              // 스케일 업
              scale: 2.2,
              child: Icon(
                icon,
                color: isInverted ? _blackColor : Colors.white,
                size: 88,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
