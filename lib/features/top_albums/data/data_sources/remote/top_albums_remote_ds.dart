import '../../models/album_model.dart';

abstract class TopAlbumsRemoteDataSource {

  /// Fetches the top albums from the remote API.
  ///
  /// Returns a list of albums.
  Future<List<AlbumEntry>> fetchTopAlbums({required int albumsCount});

}