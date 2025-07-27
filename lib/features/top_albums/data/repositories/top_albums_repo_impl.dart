import 'package:flutter/cupertino.dart';

import '../../domain/repositories/top_albums_repo.dart';
import '../data_sources/remote/top_albums_remote_ds.dart';
import '../models/album_model.dart';


class TopAlbumsRepoImpl implements TopAlbumsRepo {

  final TopAlbumsRemoteDataSource remoteDataSource;

  TopAlbumsRepoImpl({
    required this.remoteDataSource,
  });


  @override
  Future<List<AlbumEntry>> fetchTopAlbums({required int albumsCount}) async {
    debugPrint('📦 Repo called with $albumsCount albums');
    return await remoteDataSource.fetchTopAlbums(albumsCount: albumsCount);
  }


}