import 'package:app/api.dart' as MiruAPI;

void main() async {
	// Looks up anime via the Kitsu API
	final searchResults = await MiruAPI.search('that time I got reincarnated');
	searchResults.forEach((searchResult) {
		print(searchResult.toJson());
	});

	// Gets details about a specific anime via it's Kitsu ID
	final anime = await MiruAPI.getAnimeDetails(41024);
	print(anime.toJson());
	
	// Gets episode details about a specific anime via it's Kitsu ID
	final episodes = await MiruAPI.getAnimeEpisodes(41024);
	episodes.forEach((episode) {
		print(episode.toJson());
	});

	// Gets streams for an anime stream via it's Kitsu ID and episode number
	final streams = await MiruAPI.getAnimeStreams(41024, 1);
	streams.forEach((stream) {
		print(stream.toJson());
	});
}