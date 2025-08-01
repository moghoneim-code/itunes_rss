import 'package:flutter/cupertino.dart';
import 'package:itunes_rss/core/shared/enums/view_state.dart';
import '../../data/models/album_model.dart';
import '../../domain/use_cases/get_top_albums_use_cases.dart';


class TopAlbumsProvider extends ChangeNotifier {
  final GetTopAlbumsUseCase getTopAlbumsUseCase;


  TopAlbumsProvider({required this.getTopAlbumsUseCase}) {
    debugPrint('🔧 Initializing TopAlbumsProvider...');
    _init();
  }

  List<AlbumEntry> albums = [];

  ViewState viewState = ViewState.initial;
  ViewState fetchMoreViewState = ViewState.initial;


  ScrollController scrollController = ScrollController();


  Object error = '';
  final int pageSize = 10;
  int currentPage = 1;
  /// Total number of albums available in the API.
  /// >>>>  you can change this value to fetch more albums. <<<<<
  int totalAvailable = 70;

  bool get hasMoreData => albums.length < totalAvailable;

  Future<void> _init() async {
    await getTopAlbumsFromNetwork();
  }

  Future<void> getTopAlbumsFromNetwork() async {
    try {
      viewState = ViewState.loading;
      notifyListeners();

      debugPrint('📡 Fetching initial albums...');
      final data = await getTopAlbumsUseCase.call(albumsCount: pageSize);

      albums = data;
      currentPage = 1;
      viewState = ViewState.loaded;
      debugPrint('🎉 Initial albums loaded: ${albums.length}');
    } catch (e) {
      debugPrint('❌ Error fetching albums: $e');
      error = e.toString();
      viewState = ViewState.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> fetchMoreAlbums() async {
    if (!hasMoreData || fetchMoreViewState == ViewState.loading) return;

    try {
      fetchMoreViewState = ViewState.loading;
      notifyListeners();

      final nextPage = currentPage + 1;
      final newAlbums = await getTopAlbumsUseCase.call(albumsCount: pageSize * nextPage);

      final newEntries = newAlbums.skip(albums.length).toList();

      albums.addAll(newEntries);
      currentPage = nextPage;
      fetchMoreViewState = ViewState.loaded;
      debugPrint('📦 More albums loaded: ${newEntries.length}, Total: ${albums.length}');
    } catch (e) {
      debugPrint('❌ Error fetching more albums: $e');
      error = e.toString();
      fetchMoreViewState = ViewState.error;
    } finally {
      notifyListeners();
    }
  }
}
