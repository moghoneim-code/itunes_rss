import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:itunes_rss/features/top_albums/data/data_sources/remote/top_albums_remote_ds.dart';
import '../../../../../core/network/configuration/dio_config.dart';
import '../../../../../core/network/decoding/network_decoding.dart';
import '../../../../../core/network/errors/custom_exceptions.dart';
import '../../../../../core/network/network_const/network_constants.dart';
import '../../models/album_model.dart';

class TopAlbumsRemoteDataSourceImpl implements TopAlbumsRemoteDataSource {

  final Dio dio;

  TopAlbumsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<AlbumEntry>> fetchTopAlbums({required int albumsCount}) async {
    try {
      debugPrint('🌍 Fetching from API...');

      final response = await dio.get(
        NetworkConstants.topAlbumsEndPoint(albumsCount.toString()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load top albums: ${response.statusCode} ${response.statusMessage}');
      }

      final data = jsonDecode(response.data);
      final entries = data['feed']['entry'];

      debugPrint('Response data: $entries');

      if (entries == null || entries is! List) {
        throw DecodingError();
      }

      return decodeResponseList<AlbumEntry>(
          entries, (json) => AlbumEntry.fromJson(json))!;
    } catch (e) {
      if (kDebugMode) {
        print('Error in fetchTopAlbums: $e');
      }
      rethrow;
    }
  }
}
