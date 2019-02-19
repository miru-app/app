import 'package:flutter/material.dart'; // Material design package
import 'package:app/kitsu.dart' as KitsuAPI; // Kitsu API methods
import 'package:app/widgets/animewidget.dart'; // Anime widget

class HomePage extends StatelessWidget  {
	final String title;

	HomePage({Key key, this.title}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
				body: Center(
					child: FutureBuilder(
					future: KitsuAPI.getTranding(), // sets the getTranding method as the expected Future
					builder: (context, snapshot) {
						if (snapshot.hasData) { //checks if the response returns valid data
							final List<Widget> animeList = [];

							// Add the widgets to the list
							snapshot.data.forEach((anime) {
								animeList.add(AnimeWidget(anime: anime));
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
						} else if (snapshot.hasError) { //checks if the response throws an error
							return Text("${snapshot.error}");
						}

						return CircularProgressIndicator(); // If no errors and no data, assume still loading
					},
				),
			),
		);
	}
}