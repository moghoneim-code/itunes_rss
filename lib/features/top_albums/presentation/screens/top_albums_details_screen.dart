import 'package:flutter/material.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/features/top_albums/presentation/widgets/album_details_screen/album_details_appBar.dart';
import 'package:itunes_rss/features/top_albums/presentation/widgets/album_details_screen/album_details_body.dart';


class TopAlbumsDetailsScreen extends StatelessWidget {
  final AlbumEntry album;
  const TopAlbumsDetailsScreen( {super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: albumDetailsAppBar(context),
      body: AlbumDetailsBody(album: album,),
    );
  }
}
