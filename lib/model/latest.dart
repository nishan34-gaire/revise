// To parse this JSON data, do
//
//     final latest = latestFromJson(jsonString);

import 'dart:convert';

Latest latestFromJson(String str) => Latest.fromJson(json.decode(str));

String latestToJson(Latest data) => json.encode(data.toJson());

class Latest {
    Latest({
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
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

    bool ?adult;
    dynamic ? backdropPath;
    dynamic ?belongsToCollection;
    int? budget;
    List<dynamic>? genres;
    String? homepage;
    int ?id;
    dynamic? imdbId;
    String? originalLanguage;
    String ?originalTitle;
    String? overview;
    int ?popularity;
    dynamic? posterPath;
    List<ProductionCompany>? productionCompanies;
    List<ProductionCountry>? productionCountries;
    String? releaseDate;
    int ?revenue;
    int ?runtime;
    List<dynamic>? spokenLanguages;
    String ?status;
    String? tagline;
    String? title;
    bool ?video;
    int ?voteAverage;
    int? voteCount;

    factory Latest.fromJson(Map<String, dynamic> json) => Latest(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<dynamic>.from(json["genres"].map((x) => x)),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        releaseDate: json["release_date"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<dynamic>.from(json["spoken_languages"].map((x) => x)),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
        "production_countries": List<dynamic>.from(productionCountries!.map((x) => x.toJson())),
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages!.map((x) => x)),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class ProductionCompany {
    ProductionCompany({
        this.id,
        this.logoPath,
        this.name,
        this.originCountry,
    });

    int ?id;
    dynamic? logoPath;
    String? name;
    String? originCountry;

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}

class ProductionCountry {
    ProductionCountry({
        this.iso31661,
        this.name,
    });

    String ?iso31661;
    String ?name;

    factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}
