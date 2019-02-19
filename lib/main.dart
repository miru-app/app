import 'package:flutter/material.dart'; // Material design package
import 'package:app/pages/homepage.dart'; // Material design package

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

		return MaterialApp(
			title: title,
			home: HomePage(title: title),
		);
	}
}