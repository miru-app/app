import 'package:app/apis/kitsu.dart' as kitsu;

// Start the app
void main() async {
    var popular = await kitsu.getTrending();
    print(popular);
}