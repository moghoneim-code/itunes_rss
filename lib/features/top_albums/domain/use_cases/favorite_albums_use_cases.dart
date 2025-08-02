

import 'package:itunes_rss/features/top_albums/data/models/favorite_album.dart';

import '../repositories/cached_favorite_albums_repo.dart';

class FavoriteAlbumsUseCases {
  final CachedFavoriteAlbumsRepo cachedFavoriteAlbumsRepo;

  FavoriteAlbumsUseCases({required this.cachedFavoriteAlbumsRepo});


  Future<void> addAlbumToFavorites(FavoriteAlbumModel album) async {
    await cachedFavoriteAlbumsRepo.insertAlbum(album);
  }


  Future<bool> getFavoriteAlbums(String id) async {
    return await cachedFavoriteAlbumsRepo.isTheAlbumFavorite(id);
  }

  Future<void>  removeAlbumFromFavorites(FavoriteAlbumModel album) async {
    return await cachedFavoriteAlbumsRepo.removeAlbumFromFavorites(album);
  }
}