import 'package:flutter/cupertino.dart';
import 'package:itunes_rss/features/top_albums/data/data_sources/local/cached_albums_db.dart';
import 'package:itunes_rss/features/top_albums/data/models/favorite_album.dart';
import 'package:itunes_rss/features/top_albums/domain/repositories/cached_favorite_albums_repo.dart';


class CachedFavoriteAlbumsRepoImpl implements CachedFavoriteAlbumsRepo {
  final CachedFavoriteAlbumsDatabase cachedFavoriteAlbumsDatabase;

  CachedFavoriteAlbumsRepoImpl({required this.cachedFavoriteAlbumsDatabase});

  @override
  Future<int> insertAlbum(FavoriteAlbumModel favoriteAlbum) async {
    try {
      final result = await cachedFavoriteAlbumsDatabase.insertAlbum(
        favoriteAlbum,
      );

      return result ?? 0;
    } catch (e) {
      print('Error inserting album: $e');
      return 0;
    }
  }

  @override
  Future<bool> isTheAlbumFavorite(String id) async {
    try {
      final result = await cachedFavoriteAlbumsDatabase.isTheAlbumFavorite(id);
      return result ?? true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  @override
  Future<void> removeAlbumFromFavorites(FavoriteAlbumModel album) async {
    try {
      return cachedFavoriteAlbumsDatabase.removeAlbumFromFavorites(album);
    } catch (e) {
      print('Error removing album from favorites: $e');
    }
  }
}
