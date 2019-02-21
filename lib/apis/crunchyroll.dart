import 'dart:convert'; // Data conversion lib
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http; // HTTP package
import 'package:query_params/query_params.dart';

final Uuid uuid = new Uuid();

const String apiEndpointBase = 'https://api.crunchyroll.com';

const Map<String, String> apiEndpoints = {
	'startSession': '$apiEndpointBase/start_session.0.json',
	'login': '$apiEndpointBase/login.0.json',
	'autocomplete': '$apiEndpointBase/autocomplete.0.json',
	'listCollections': '$apiEndpointBase/list_collections.0.json',
	'listMedia': '$apiEndpointBase/list_media.0.json',
	'info': '$apiEndpointBase/info.0.json',
	'listSeries': '$apiEndpointBase/list_series.0.json'
};

const Map<String, String> postHeaders = {
	'Content-Type': 'application/x-www-form-urlencoded'
};

class CRClient {
	final String accessToken = 'LNDJgOit5yaRIWN';
	final String deviceType = 'com.crunchyroll.windows.desktop';
	final String locale = 'enUS';
	final String version = '1.1.21.0';
	final String connectivityType = 'ethernet';
	final String deviceID = uuid.v4();

	String username;
	String password;
	Map<String, dynamic> session;
	Map<String, dynamic> userSession;

	startSession() async {
		URLQueryParams query = new URLQueryParams();
		query.append('access_token', this.accessToken);
		query.append('device_type', this.deviceType);
		query.append('device_id', this.deviceID);

		final response = await http.get('${apiEndpoints['startSession']}?${query.toString()}');
		if (response.statusCode == 200) {
			// Parse the JSON
			final Map<String, dynamic> result = json.decode(response.body);
			
			this.session = result;
		} else {
			throw Exception('Failed to load response');
		}
	}

	login(String username, String password) async {
		if (this.session == null) {
			await this.startSession();
		}

		this.username = username;
		this.password = password;

		final Map<String, String> body = {
			'account': this.username,
			'password': this.password,
			'session_id': this.session['data']['session_id']
		};

		final response = await http.post('${apiEndpoints['login']}', body: body, headers: postHeaders);
		if (response.statusCode == 200) {
			// Parse the JSON
			final Map<String, dynamic> result = json.decode(response.body);
			
			this.userSession = result;
		} else {
			throw Exception('Failed to load response');
		}
	}

	search(String query) async {
		final Map<String, String> body = {
			'classes': 'series',
			'fields': [
				'series.name',
				'series.series_id',
				'series.etp_guid',
				'series.media_count',
				'series.media_type',
				'series.portrait_image',
				'image.large_url',
				'image.full_url',
				'series.rating',
				'series.genres',
				'series.description'
			].join(','),
			'media_types': 'anime|drama',
			'q': query,
			'session_id': this.session['data']['session_id']
		};

		final response = await http.post('${apiEndpoints['autocomplete']}', body: body, headers: postHeaders);
		if (response.statusCode == 200) {
			// Parse the JSON
			final Map<String, dynamic> result = json.decode(response.body);
			
			return result;
		} else {
			throw Exception('Failed to load response');
		}
	}

	listCollections(String seriesID, {String sort='desc'}) async {
		final Map<String, dynamic> body = {
			'classes': 'series',
			'fields': [
				'collections.collections_id',
				'collections.season',
				'collections.name',
				'collections.availability_notes',
				'collections.landscape_image',
				'image.fwide_url'
			].join(','),
			'series_id': seriesID,
			'session_id': this.session['data']['session_id'],
			'sort': sort
		};

		final response = await http.post('${apiEndpoints['listCollections']}', body: body, headers: postHeaders);
		if (response.statusCode == 200) {
			// Parse the JSON
			final Map<String, dynamic> result = json.decode(response.body);
			
			return result;
		} else {
			throw Exception('Failed to load response');
		}
	}

	listMedia(String collectionID, {String sort='desc'}) async {
		final Map<String, dynamic> body = {
			'collection_id': collectionID,
			'fields': [
				'media.media_id',
				'media.etp_guid',
				'media.episode_number',
				'media.series_id',
				'media.series_etp_guid',
				'media.name',
				'media.collection_name',
				'media.series_name',
				'media.available',
				'media.available_time',
				'media.premium_only',
				'media.screenshot_image',
				'media.availability_notes',
				'media.duration',
				'media.media_type',
				'media.playhead',
				'media.hardsub_lang',
				'media.audio_lang',
				'image.wide_url',
				'image.widestar_url',
				'image.fwide_url',
				'image.fwidestar_url',
				'media.series_name',
				'media.url'
			].join(','),
			'session_id': this.session['data']['session_id'],
			'sort': sort
		};

		final response = await http.post('${apiEndpoints['listMedia']}', body: body, headers: postHeaders);
		if (response.statusCode == 200) {
			// Parse the JSON
			final Map<String, dynamic> result = json.decode(response.body);
			
			return result;
		} else {
			throw Exception('Failed to load response');
		}
	}

	info(String mediaID) async {
		final Map<String, dynamic> body = {
			'session_id': this.session['data']['session_id'],
			'media_id': mediaID,
			'classes': 'series',
			'fields': [
				'media.stream_data',
				'media.media_id'
			].join(',')
		};

		final response = await http.post('${apiEndpoints['info']}', body: body, headers: postHeaders);
		if (response.statusCode == 200) {
			// Parse the JSON
			final Map<String, dynamic> result = json.decode(response.body);
			
			return result;
		} else {
			throw Exception('Failed to load response');
		}
	}
}