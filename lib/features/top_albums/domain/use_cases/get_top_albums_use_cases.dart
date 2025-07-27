import 'package:flutter/cupertino.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/features/top_albums/domain/repositories/top_albums_repo.dart';

class GetTopAlbumsUseCase {
  final TopAlbumsRepo topAlbumsRepo;

  GetTopAlbumsUseCase({required this.topAlbumsRepo});

  Future<List<AlbumEntry>> call({required int albumsCount}) async {
    if (albumsCount <= 0) {
      debugPrint('⚠️ albumsCount must be positive. Defaulting to 10.');
      albumsCount = 10;
    }

    try {
      debugPrint('🏁 UseCase: Fetching $albumsCount albums...');
      final albums = await topAlbumsRepo.fetchTopAlbums(albumsCount: albumsCount);
      debugPrint('✅ UseCase: Retrieved ${albums.length} albums');
      return albums;
    } catch (e) {
      debugPrint('❌ UseCase Error: $e');
      rethrow;
    }
  }
}
