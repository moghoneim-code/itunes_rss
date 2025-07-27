import '../../data/models/album_model.dart';

abstract class TopAlbumsRepo {
  Future<List<AlbumEntry>> fetchTopAlbums({required int albumsCount});
}