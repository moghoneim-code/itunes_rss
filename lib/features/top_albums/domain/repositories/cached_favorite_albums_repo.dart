import '../../data/models/favorite_album.dart';

abstract class CachedFavoriteAlbumsRepo {
  Future<int> insertAlbum(FavoriteAlbumModel favoriteAlbum);

  Future<bool> isTheAlbumFavorite(String id);

  Future<void> removeAlbumFromFavorites(FavoriteAlbumModel album);

}
