class WebtoonModel {
  String id, title, thumb;

  WebtoonModel({
    required this.id,
    required this.title,
    required this.thumb,
  });

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumb = json['thumb'];
}

// {"title":"입학용병","thumb":"https://shared-comic.pstatic.net/thumb/webtoon/758150/thumbnail/thumbnail_IMAG21_4135492154714961716.jpg
// ","id":"758150"}