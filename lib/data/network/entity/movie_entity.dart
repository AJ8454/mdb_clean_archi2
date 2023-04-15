class UpcomingMovies {
  UpcomingMovies({
    required this.page,
    required this.next,
    required this.entries,
    required this.results,
  });

  int page;
  String next;
  int entries;
  List<MovieEntity> results;
}

class MovieEntity {
  MovieEntity({
    required this.id,
    this.primaryImage,
    required this.titleType,
    required this.titleText,
    this.releaseYear,
    required this.releaseDate,
  });

  String id;
  PrimaryImage? primaryImage;
  TitleType titleType;
  TitleText titleText;
  ReleaseYear? releaseYear;
  ReleaseDate releaseDate;
}

class PrimaryImage {
  PrimaryImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.caption,
    required this.typename,
  });

  String id;
  int width;
  int height;
  String url;
  Caption caption;
  String typename;
}

class Caption {
  Caption({
    required this.plainText,
    required this.typename,
  });

  String plainText;
  String typename;
}

class ReleaseDate {
  ReleaseDate({
    required this.day,
    required this.month,
    required this.year,
    required this.typename,
  });

  int day;
  int month;
  int year;
  String typename;
}

class ReleaseYear {
  ReleaseYear({
    required this.year,
    this.endYear,
    required this.typename,
  });

  int year;
  dynamic endYear;
  String typename;
}

class TitleText {
  TitleText({
    required this.text,
    required this.typename,
  });

  String text;
  String typename;
}

class TitleType {
  TitleType({
    required this.text,
    required this.id,
    required this.isSeries,
    required this.isEpisode,
    required this.typename,
    this.categories,
    this.canHaveEpisodes,
  });

  String text;
  String id;
  bool isSeries;
  bool isEpisode;
  String typename;
  List<Category>? categories;
  bool? canHaveEpisodes;
}

class Category {
  Category({
    required this.value,
    required this.typename,
  });

  String value;
  String typename;
}
