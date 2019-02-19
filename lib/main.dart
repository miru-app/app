import 'package:flutter/material.dart'; // Material design package
import 'package:cached_network_image/cached_network_image.dart'; // Used for image caching and dynamic loading
import 'package:app/kitsu.dart' as KitsuAPI; // Kitsu API methods
import 'package:app/anime.dart'; // Custom anime classes

// Start the app
void main() {
	// Run the app
	runApp(MiruApp());
}

// This is where the app lives
class MiruApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final title = 'Miru';

		// For now I'm using the default material design classes
		// We need to build our own custom widgets though
		return new MaterialApp(
			title: title,
			home: new FutureBuilder(future: new Future(() async {
				return KitsuAPI.getTranding();
			}),
			builder: (BuildContext context, AsyncSnapshot<List<Anime>> snapshot) {
				// Very basic error handling
				if (snapshot.error != null) {
					return Text(title);
				}

				// If the data has not been fully received, display a loading icon
				if (snapshot.data == null) {
					return new Center(child: new CircularProgressIndicator());
				}
				
				// This is where the image components live
				final List<Widget> animeList = [];

				// Add the widgets to the list
				snapshot.data.forEach((anime) {
					animeList.add(Container(
						width: 284,
						height: 402,
						child: CachedNetworkImage(
							imageUrl: anime.posterUrl,
							placeholder: (context, url) => new CircularProgressIndicator(),
						)
					));
				});

				// Building the basic UI
				return Scaffold(
					appBar: AppBar(
						title: Text(title),
					),
					body: ListView(
						scrollDirection: Axis.horizontal,
						children: animeList,
					),
				);
			}),
		);
	}
}