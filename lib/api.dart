import 'dart:convert'; // Data conversion lib
import 'package:crypto/crypto.dart'; // Crypto package
import 'package:http/http.dart' as http; // HTTP package
import 'package:app/anime.dart'; // Custom anime classes
import 'package:app/config.dart'; // App config

Future<List<AnimeStream>> getAnimeStreams(int kitsuID, int episodeNumber) async {
	// HMAC secret key
	final List<int> secret = utf8.encode(config['signature_secret']);

	// The real JSON payload the server expects
	final String jsonString = '{"id":$kitsuID,"episode":$episodeNumber}'; // Removes a call to jsonEncode
	final List<int> data = utf8.encode(jsonString); // Make sure the data is a UTF-8 string
	final Digest signature = new Hmac(sha1, secret).convert(data); // Hash the data

	// Setup the POST payload
	final Map<String, String> body = {
		'data': jsonString,
		'signature': signature.toString()
	};

	// Send the POST request
	final response = await http.post('http://localhost:8080/api/getStreams', body: body);
	if (response.statusCode == 200) {
		// Parse the JSON
		final Map<String, dynamic> result = json.decode(response.body);
		final List<dynamic> data = result['data'];
		final List<AnimeStream> streams = data.map((i) => AnimeStream.fromJson(i)).toList();
		return streams;
	} else {
		throw Exception('Failed to load anime streams');
	}
}