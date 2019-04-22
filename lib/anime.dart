class Anime {
  final int id;
  final String title;
  final int averageRating;
  final int popularityRank;
  final int ratingRank;
  final String rating;
  final String status;
  final String synopsis;
  final String startDate;
  final String endDate;
  final String trailerId;
  final int episodeCount;
  final int releasedCount;
  final String posterUrl;
  final String coverUrl;
  final String showType;
  final int episodeLength;

  Anime({this.id, this.title, this.averageRating, this.popularityRank, this.ratingRank, this.rating,  this.status, this.synopsis, this.startDate, this.endDate, this.trailerId, this.episodeCount, this.releasedCount, this.posterUrl, this.coverUrl, this.showType, this.episodeLength});

  factory Anime.fromJson(Map<String, dynamic> json) {
    int releasedCount;
    String posterUrl;
    String coverUrl;

    if (
      json['attributes']['episodeLength'] == null ||
      json['attributes']['totalLength'] == null ||
      json['attributes']['episodeLength'] <= 0 ||
      json['attributes']['totalLength'] <= 0
    ) {
      releasedCount = 0;
    } else {
      // Hack to get the total number of released episodes, since Kitsu does not give us that directly
      releasedCount = (json['attributes']['totalLength'] / json['attributes']['episodeLength']).ceil();
    }

    if (json['attributes']['posterImage'] != null) {
      posterUrl = json['attributes']['posterImage']['original'];
    } else {
      posterUrl = 'http://some.default/image.png';
    }

    if (json['attributes']['coverImage'] != null) {
      coverUrl = json['attributes']['coverImage']['original'];
    } else {
      coverUrl = 'http://some.default/image.png';
    }

    return Anime(
      id: int.parse(json['id']), // Kitsu why the hell do you return the ID as a string when it's a number
      title: json['attributes']['canonicalTitle'],
      averageRating: double.parse(json['attributes']['averageRating']).ceil(),
      popularityRank: json['attributes']['popularityRank'],
      ratingRank: json['attributes']['ratingRank'],
      rating: json['attributes']['rating'],
      status: json['attributes']['status'],
      synopsis: json['attributes']['synopsis'],
      startDate: json['attributes']['startDate'],
      endDate: json['attributes']['endDate'],
      trailerId: json['attributes']['youtubeVideoId'],
      episodeCount: json['attributes']['episodeCount'],
      releasedCount: releasedCount,
      posterUrl: posterUrl,
      coverUrl: coverUrl,
      showType: json['attributes']['showType'],
      episodeLength: json['attributes']['episodeLength']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'status': this.status,
      'synopsis': this.synopsis,
      'startDate': this.startDate,
      'endDate': this.endDate,
      'trailerId': this.trailerId,
      'episodeCount': this.episodeCount,
      'releasedCount': this.releasedCount,
      'posterUrl': this.posterUrl,
      'coverUrl': this.coverUrl,
    };
  }
}

class AnimeEpisode {
  final int episodeNumber;
  final String title;
  final String synopsis;
  final String thumbnailUrl;
  final String airDate;

  AnimeEpisode({this.episodeNumber, this.title, this.synopsis, this.thumbnailUrl, this.airDate});

  factory AnimeEpisode.fromJson(Map<String, dynamic> json) {
    String thumbnailUrl;

    if (json['attributes']['thumbnail'] != null) {
      thumbnailUrl = json['attributes']['thumbnail']['original'];
    } else {
      thumbnailUrl = 'http://some.default/image.png';
    }

    return AnimeEpisode(
      episodeNumber: json['attributes']['number'],
      title: json['attributes']['canonicalTitle'],
      synopsis: json['attributes']['synopsis'],
      thumbnailUrl: thumbnailUrl,
      airDate: json['attributes']['airdate']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'episodeNumber': this.episodeNumber,
      'title': this.title,
      'synopsis': this.synopsis,
      'thumbnailUrl': this.thumbnailUrl,
      'airDate': this.airDate,
    };
  }
}

class AnimeStream {
  final String provider;
  final String providerFull;
  final String fileHost;
  final String file;
  final bool dubbed;
  final String quality;
  final bool m3u8;
  final String subtitlesFile;

  AnimeStream({this.provider, this.providerFull, this.fileHost, this.file, this.dubbed, this.quality, this.m3u8, this.subtitlesFile});

  factory AnimeStream.fromJson(Map<String, dynamic> json) {
    return AnimeStream(
      provider: json['provider'],
      providerFull: json['provider_full'],
      fileHost: json['file_host'],
      file: json['file'],
      dubbed: json['dubbed'],
      quality: json['quality'],
      m3u8: json['m3u8'],
      subtitlesFile: json['subtitles_file']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provider': this.provider,
      'providerFull': this.providerFull,
      'fileHost': this.fileHost,
      'file': this.file,
      'dubbed': this.dubbed,
      'quality': this.quality,
      'm3u8': this.m3u8,
      'subtitlesFile': this.subtitlesFile
    };
  }
}