import 'package:flutter/cupertino.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/features/top_albums/domain/repositories/top_albums_repo.dart';

class GetTopAlbumsUseCase {
  final TopAlbumsRepo topAlbumsRepo;

  GetTopAlbumsUseCase({required this.topAlbumsRepo});


  Future<List<AlbumEntry>> call({required int albumsCount}) {
    debugPrint('🏁 UseCase called with $albumsCount albums');
    return topAlbumsRepo.fetchTopAlbums(albumsCount: albumsCount);
  }

}
