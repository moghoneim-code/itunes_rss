import 'package:flutter/material.dart';
import 'package:itunes_rss/features/top_albums/data/data_sources/local/cached_albums_db.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/features/top_albums/presentation/providers/top_albums_provider.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/abum_details/widgets/album_details_appBar.dart';
import 'package:itunes_rss/features/top_albums/presentation/screens/abum_details/widgets/album_details_body.dart';
import 'package:provider/provider.dart';


class AlbumDetailsScreen extends StatefulWidget {
  final AlbumEntry album;

  const AlbumDetailsScreen({super.key, required this.album});

  @override
  State<AlbumDetailsScreen> createState() => _AlbumDetailsScreenState();
}

class _AlbumDetailsScreenState extends State<AlbumDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return Consumer<TopAlbumsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (){
          CachedFavoriteAlbumsDatabase.instance.printDatabase();
          }) ,
          appBar: albumDetailsAppBar(
            context: context,
            album: widget.album,
          ),
          body: AlbumDetailsBody(album: widget.album),
        );
      },
    );
  }
}
