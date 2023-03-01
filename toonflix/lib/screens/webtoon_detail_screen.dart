import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/webtoon_api_service.dart';
import 'package:toonflix/widgets/webtoon_episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // constructor에서 widget이 참조될 수 없다.
  // Future<WebtoonDetailModel> webtoon = ApiService.getToonById(widget.id); // error
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences preferences;
  bool isLiked = false;

  @override
  void initState() {
    // construtor 대신 initState 메서드에서 widget을 참조한다.
    super.initState();
    webtoon =
        ApiService.getToonById(widget.id); // initState에서는 widget을 참조할 수 있다.
    episodes = ApiService.getLatestEpisodesById(widget.id);
    initPreferences();
  }

  initPreferences() async {
    preferences =
        await SharedPreferences.getInstance(); // 휴대폰 저장소에 access를 얻는다.
    final likeToons = preferences
        .getStringList("likeToons"); // likeToons라는 키의 String List가 있는지 확인한다.
    if (likeToons != null) {
      if (likeToons.contains(widget.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      // 사용자가 처음 앱을 실행하는 경우엔 `likeToons`가 존재하지 않아 만들어주는 코드ㅡ
      await preferences.setStringList("likeToons", []);
    }
  }

  onHeartTap() async {
    final likeToons = preferences.getStringList("likeToons");
    if (likeToons != null) {
      if (isLiked) {
        likeToons.remove(widget.id);
      } else {
        likeToons.add(widget.id);
      }
      await preferences.setStringList("likeToons", likeToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title, // 부모의 title stateful widget의 data를 받아오는 방법
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              isLiked
                  ? Icons.favorite_outlined
                  : Icons.favorite_outline_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // overflow 문제를 해결한다.

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 50,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.3),
                          )
                        ],
                      ),
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "${snapshot.data!.genre} / ${snapshot.data!.age}",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(
                height: 26,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          )
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
