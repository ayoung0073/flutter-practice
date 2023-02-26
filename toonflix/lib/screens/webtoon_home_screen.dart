import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/webtoon_api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // const를 제외해야한다. 클래스에 future를 넣었기 때문에! const라면 컴파일 전에 값을 미리 알고있어야한다.

  Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 1, // 음영
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          title: const Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              const SizedBox(
                height: 100,
              ),
              Expanded(child: makeList(snapshot))
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ]),
              child: Image.network(webtoon.thumb),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 30,
      ),
    );
  }
}
