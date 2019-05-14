import 'dart:convert' show json;

class MovieList {
  List<Movie> list;

  MovieList.fromParams({this.list});

  factory MovieList(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new MovieList.fromJson(json.decode(jsonStr))
          : new MovieList.fromJson(jsonStr);

  MovieList.fromJson(jsonRes) {
    list = jsonRes == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['list']) {
      list.add(listItem == null ? null : new Movie.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"json_list": $list}';
  }
}

class Movie {
  String title;
  String url;

  Movie.fromParams({this.title, this.url});

  Movie.fromJson(jsonRes) {
    title = jsonRes['title'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"title": ${title != null ? '${json.encode(title)}' : 'null'},"url": ${url != null ? '${json.encode(url)}' : 'null'}}';
  }
}
