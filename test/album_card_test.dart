import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/top_albums/widgets/top_album_card.dart';

/// Fake CachedNetworkImageWidget because http requests is blocked you know :(
class FakeCachedNetworkImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool isRounded;
  final bool isElevated;
  final String imageUrl;

  const FakeCachedNetworkImageWidget({
    super.key,
    required this.height,
    required this.width,
    required this.isRounded,
    required this.isElevated,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.grey,
      child: const Icon(Icons.image),
    );
  }
}

void main() {
  setUpAll(() {
    registerFallbackValue(
        FakeCachedNetworkImageWidget(
      height: 100,
      width: 100,
      isRounded: false,
      isElevated: false,
      imageUrl: '',
    ));
  });

  testWidgets('AlbumCard displays album data and handles tap',
          (WidgetTester tester) async {
        bool tapped = false;
        final String mockData = await rootBundle.loadString('assets/mock_album_feed.json');
        final data = json.decode(mockData);
        final dummyAlbum = AlbumEntry.fromJson(data['feed']['entry'][0]);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AlbumCard(
                album: dummyAlbum,
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        expect(find.text('KPop Demon Hunters (Soundtrack from the Netflix Film)'), findsOneWidget);
        expect(find.text('KPop Demon Hunters Cast, HUNTR/X & Saja Boys'), findsOneWidget);
        expect(find.text('\$9.99'), findsOneWidget);

        await tester.tap(find.byType(ListTile));
        await tester.pump();

        expect(tapped, isTrue);
      });
}
