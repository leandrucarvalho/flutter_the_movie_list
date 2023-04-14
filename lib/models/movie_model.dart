class Movie {
  final String? posterPath;
  final bool? adult;
  final String? overview;
  final String? releaseDate;
  final String? originalTitle;
  final List<int>? genreIds;
  final int? id;
  final String? mediaType;
  final String? originalLanguage;
  final String? title;
  final String? backdropPath;
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final num? voteAverage;

  Movie(
      {this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.originalTitle,
      this.genreIds,
      this.id,
      this.mediaType,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      posterPath: json['poster_path'],
      adult: json['adult'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      mediaType: json['media_type'],
      originalLanguage: json['original_language'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      popularity: (json['popularity'] as num).toDouble(),
      voteCount: json['vote_count'],
      video: json['video'],
      voteAverage: json['vote_average'],
    );
  }

  Movie copWith({
    final String? posterPath,
    final bool? adult,
    final String? overview,
    final String? releaseDate,
    final String? originalTitle,
    final List<int>? genreIds,
    final int? id,
    final String? mediaType,
    final String? originalLanguage,
    final String? title,
    final String? backdropPath,
    final double? popularity,
    final int? voteCount,
    final bool? video,
    final num? voteAverage,
  }) {
    return Movie(
      posterPath: posterPath ?? this.posterPath,
      adult: adult ?? this.adult,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      originalTitle: originalTitle ?? this.originalTitle,
      genreIds: genreIds ?? this.genreIds,
      id: id ?? this.id,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      popularity: popularity ?? this.popularity,
      voteCount: voteCount ?? this.voteCount,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }
}
