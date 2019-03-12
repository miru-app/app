import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getNextEpisodeDate(String title) async {

  var response = await http.get('http://api.tvmaze.com/search/shows?q=$title');
  if (response.statusCode != 200) {
    return null;
  }

  List<dynamic> animeList = json.decode(response.body);
  final anime = animeList.firstWhere((anime) => anime['show']['name'] == title, orElse: () => null);

  if (anime == null) {
    return null;
  }

  final links = anime['show']['_links'];

  if (links == null || links['nextepisode'] == null || links['nextepisode']['href'] == null) {
		return null;
	}

  response = await http.get(links['nextepisode']['href']);
  if (response.statusCode != 200) {
    return null;
  }

  Map<String, dynamic> episode = json.decode(response.body);

  return episode;
}

/*
void main() {
  getNextEpisodeDate('That Time I Got Reincarnated as a Slime').then((nextEpisodeDate) {
    print(nextEpisodeDate);
  });
}
*/