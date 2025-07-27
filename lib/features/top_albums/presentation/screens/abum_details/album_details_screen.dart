import 'package:flutter/material.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/abum_details/widgets/album_details_appBar.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/abum_details/widgets/album_details_body.dart';


class AlbumDetailsScreen extends StatelessWidget {
  final AlbumEntry album;
  const AlbumDetailsScreen( {super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: albumDetailsAppBar(context),
      body: AlbumDetailsBody(album: album,),
    );
  }
}
