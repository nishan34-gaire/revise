// To parse   this  JSON data, do
//
//     final nishan = nishanFromJson(jsonString);
import 'dart:convert';

Nishan nishanFromJson(String str) => Nishan.fromJson(json.decode(str));

String nishanToJson(Nishan data) => json.encode(data.toJson());

class Nishan {
  Nishan({
    this.adult,
    this.backdropPath =
        "data:image/jpeg;base64,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",
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage =
        "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1501DX.img?w=800&h=415&q=60&m=2&f=jpg",
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  DateTime? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory Nishan.fromJson(Map<String, dynamic> json) => Nishan(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompany.fromJson(x))),
        productionCountries: List<ProductionCountry>.from(
            json["production_countries"]
                .map((x) => ProductionCountry.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages!.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompany {
  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"] ?? null,
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath ?? null,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountry {
  ProductionCountry({
    this.iso31661,
    this.name,
  });

  String? iso31661;
  String? name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  String? englishName;
  String? iso6391;
  String? name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
