class Movie {
  Movie({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Movie.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  Movie copyWith({
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      Movie(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}

class Results {
  Results({
    this.id,
    this.title,
    this.releaseDate,
    this.overview,
    this.posterURL,
  }): isFavorite = false;

  Results.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    releaseDate = json['releaseDate'];
    overview = json['overview'];
    posterURL = json['poster URL'];
  }
  int? id;
  String? title;
  String? releaseDate;
  String? overview;
  String? posterURL;
  bool isFavorite = false;
  Results copyWith({
    int? id,
    String? title,
    String? releaseDate,
    String? overview,
    String? posterURL,
  }) =>
      Results(
        id: id ?? this.id,
        title: title ?? this.title,
        releaseDate: releaseDate ?? this.releaseDate,
        overview: overview ?? this.overview,
        posterURL: posterURL ?? this.posterURL,

      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['releaseDate'] = releaseDate;
    map['overview'] = overview;
    map['poster URL'] = posterURL;
    return map;
  }
}
