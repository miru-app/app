import 'dart:convert'; // Data conversion lib
import 'package:http/http.dart' as http; // HTTP package
import 'package:app/anime.dart'; // Custom anime classes

Future<List<Anime>> search(String query) async {
	final response = await http.get('https://kitsu.io/api/edge/anime?filter[text]=$query');
	if (response.statusCode == 200) {
		// Parse the JSON
		final Map<String, dynamic> result = json.decode(response.body);
		final List<dynamic> data = result['data'];
		final List<Anime> streams = data.map((i) => Anime.fromJson(i)).toList();
		return streams;
	} else {
		throw Exception('Failed to load anime streams');
	}
}

Future<List<Anime>> getTranding() async {
	final response = await http.get('https://kitsu.io/api/edge/trending/anime');
	if (response.statusCode == 200) {
		// Parse the JSON
		final Map<String, dynamic> result = json.decode(response.body);
		final List<dynamic> data = result['data'];
		final List<Anime> streams = data.map((i) => Anime.fromJson(i)).toList();
		return streams;
	} else {
		throw Exception('Failed to load anime streams');
	}
}

Future<Anime> getAnimeDetails(int id) async {
	final response = await http.get('https://kitsu.io/api/edge/anime/$id');
	if (response.statusCode == 200) {
		// Parse the JSON
		final Map<String, dynamic> data = json.decode(response.body);
		return Anime.fromJson(data['data']);
	} else {
		throw Exception('Failed to load anime streams');
	}
}

// I feel like this can be improved, a lot
Future<List<AnimeEpisode>> getAnimeEpisodes(int id) async {
	final List<Map<String, dynamic>> episodesList = [];

	var response = await http.get('https://kitsu.io/api/edge/anime/$id/episodes');
	Map<String, dynamic> result = json.decode(response.body);
	result['data'].forEach((episode) {
		episodesList.add(episode);
	});

	while (result['links'].containsKey('next')) {
		response = await http.get(result['links']['next']);
		result = json.decode(response.body);
		result['data'].forEach((episode) {
			episodesList.add(episode);
		});
	}

	final List<AnimeEpisode> episodes = episodesList.map((i) => AnimeEpisode.fromJson(i)).toList();
	return episodes;
}