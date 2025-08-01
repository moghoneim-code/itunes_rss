import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:itunes_rss/features/top_albums/data/data_sources/remote/top_albums_remote_ds_impl.dart';
import 'package:itunes_rss/features/top_albums/data/models/album_model.dart';
import 'package:itunes_rss/core/network/errors/custom_exceptions.dart';
import 'package:mocktail/mocktail.dart';


class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late TopAlbumsRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = TopAlbumsRemoteDataSourceImpl(dio: mockDio);
  });

  test('returns list of AlbumEntry on successful response', () async {
    final responseJson = {
      "feed": {
        "entry": [
          {
            "im:name": {"label": "Test Album"},
            "im:artist": {"label": "Test Artist"},
            "im:image": [{"label": "https://example.com/image.png"}]
          }
        ]
      }
    };

    final fakeResponse = Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
      data: jsonEncode(responseJson),
    );

    when(() => mockDio.get(any())).thenAnswer((_) async => fakeResponse);

    final result = await dataSource.fetchTopAlbums(albumsCount: 1);

    expect(result, isA<List<AlbumEntry>>());
    expect(result.first.title.label, "Test Album");
    expect(result.first.imArtist.label, "Test Artist");
  });

  test('throws DecodingError when entry is not a list', () async {
    final responseJson = {
      "feed": {
        "entry": "invalid"
      }
    };

    final fakeResponse = Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 200,
      data: jsonEncode(responseJson),
    );

    when(() => mockDio.get(any())).thenAnswer((_) async => fakeResponse);

    expect(
          () => dataSource.fetchTopAlbums(albumsCount: 1),
      throwsA(isA<DecodingError>()),
    );
  });

  test('throws Exception when status code is not 200', () async {
    final fakeResponse = Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 500,
      statusMessage: "Internal Server Error",
      data: 'Error',
    );

    when(() => mockDio.get(any())).thenAnswer((_) async => fakeResponse);

    expect(
          () => dataSource.fetchTopAlbums(albumsCount: 1),
      throwsA(isA<Exception>()),
    );
  });
}
