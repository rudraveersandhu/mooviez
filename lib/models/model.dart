class Show {
  final int id;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int runtime;
  final String premiered;
  final String officialSite;
  final Schedule schedule;
  final Rating rating;
  final Network network;
  final MovieImage image;
  final String summary;

  Show({
    required this.id,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.premiered,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.network,
    required this.image,
    required this.summary,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      language: json['language'] ?? '',
      genres: List<String>.from(json['genres']),
      status: json['status'],
      runtime: json['runtime'] ?? 0,
      premiered: json['premiered'] ?? '',
      officialSite: json['officialSite'] ?? '',
      schedule: Schedule.fromJson(json['schedule']),
      rating: Rating.fromJson(json['rating']),
      network: json['network'] != null ? Network.fromJson(json['network']) : Network(name: '', country: Country(name: '', code: '', timezone: '')),
      image: json['image'] != null ? MovieImage.fromJson(json['image']) : MovieImage(medium: '', original: ''),
      summary: json['summary'] ?? '',
    );
  }
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'],
      days: List<String>.from(json['days']),
    );
  }
}

class Rating {
  final double average;

  Rating({required this.average});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average']?.toDouble() ?? 0.0,
    );
  }
}

class Network {
  final String name;
  final Country country;

  Network({required this.name, required this.country});

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      name: json['name'] ?? '',
      country: Country.fromJson(json['country']),
    );
  }
}

class Country {
  final String name;
  final String code;
  final String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      timezone: json['timezone'] ?? '',
    );
  }
}

class MovieImage {
  final String medium;
  final String original;

  MovieImage({
    required this.medium,
    required this.original,
  });

  factory MovieImage.fromJson(Map<String, dynamic> json) {
    return MovieImage(
      medium: json['medium'] ?? '',
      original: json['original'] ?? '',
    );
  }
}
