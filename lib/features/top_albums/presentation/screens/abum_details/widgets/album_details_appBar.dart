import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';

import 'favorite_button.dart';

AppBar albumDetailsAppBar({
  required BuildContext context,
  required AlbumEntry album,
}) {
  return AppBar(
    title: const Text('Album Details'),
    centerTitle: true,
    backgroundColor: Colors.black87,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context),
    ),
    actions: [
      IconButton(icon: const Icon(Icons.share, size: 20), onPressed: () {}),
      FavoriteButtonWidget(album: album),
    ],
  );
}
