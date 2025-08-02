import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/features/top_albums/presentation/providers/top_albums_provider.dart';
import 'package:provider/provider.dart';

class FavoriteButtonWidget extends StatefulWidget {
  final AlbumEntry album;

  const FavoriteButtonWidget({super.key, required this.album});

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TopAlbumsProvider>(
      builder: (context, provider, child) {
        return FutureBuilder(
          future: provider.isAlbumFavorite(widget.album.id.attributes.imId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  Container();
            } else if (snapshot.hasError) {
              return Container();
            } else {
              final isFavorite = snapshot.data ?? false;
              return FavoriteButton(
                isFavorite: isFavorite,
                iconSize: 36.0,
                valueChanged: (isFavorite) {
                  if (isFavorite) {
                    provider.addAlbumToFavorites(widget.album);
                    setState(() {});
                  } else {
                    provider.removeAlbumFromFavorites(widget.album);
                    setState(() {});
                  }
                },
              );
            }
          },
        );
      },
    );
  }
}
