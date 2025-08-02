import 'package:get_it/get_it.dart';
import 'package:itunes_rss/features/top_albums/data/data_sources/remote/top_albums_remote_ds.dart';
import 'package:itunes_rss/features/top_albums/data/data_sources/remote/top_albums_remote_ds_impl.dart';
import 'package:itunes_rss/features/top_albums/data/repositories/top_albums_repo_impl.dart';
import 'package:itunes_rss/features/top_albums/domain/repositories/top_albums_repo.dart';
import 'package:itunes_rss/features/top_albums/domain/use_cases/favorite_albums_use_cases.dart';
import 'package:itunes_rss/features/top_albums/domain/use_cases/get_top_albums_use_cases.dart';
import 'package:itunes_rss/features/top_albums/presentation/providers/top_albums_provider.dart';
import '../../../../core/network/configuration/dio_config.dart';
import 'package:itunes_rss/features/top_albums/data/data_sources/local/cached_albums_db.dart';

import '../../data/repositories/Cached_FavoriteAlbums_Repo_impl.dart';
import '../repositories/cached_favorite_albums_repo.dart';

final getItInstance = GetIt.instance;

Future<void> initTopAlbumsFeature() async {
  /// PROVIDERS
  getItInstance.registerFactory(
    () => TopAlbumsProvider(getTopAlbumsUseCase: getItInstance() ,
        favoriteAlbumsUseCases: getItInstance()),
  );

  /// USE CASES
  getItInstance.registerLazySingleton(
    () => GetTopAlbumsUseCase(topAlbumsRepo: getItInstance()),
  );

  getItInstance.registerLazySingleton(
    () => FavoriteAlbumsUseCases(cachedFavoriteAlbumsRepo: getItInstance()),
  );

  /// REPOSITORIES
  getItInstance.registerLazySingleton<TopAlbumsRepo>(
    () => TopAlbumsRepoImpl(remoteDataSource: getItInstance()),
  );

  /// DATA SOURCES
  getItInstance.registerLazySingleton<TopAlbumsRemoteDataSource>(
    () => TopAlbumsRemoteDataSourceImpl(dio: getItInstance()),
  );

  /// DIO CLIENT
  getItInstance.registerLazySingleton(() => baseDioClient());

  /// LOCAL DATA SOURCE
  getItInstance.registerLazySingleton<CachedFavoriteAlbumsDatabase>(
    () => CachedFavoriteAlbumsDatabase.instance,
  );

  /// Registering the CachedFavoriteAlbumsRepo
  getItInstance.registerLazySingleton<CachedFavoriteAlbumsRepo>(
    () => CachedFavoriteAlbumsRepoImpl(
      cachedFavoriteAlbumsDatabase: getItInstance(),
    ),
  );
}
