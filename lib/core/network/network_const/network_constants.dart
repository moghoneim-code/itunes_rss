class NetworkConstants {
  NetworkConstants._();

  static const String baseUrl = 'https://itunes.apple.com';


  static String topAlbumsEndPoint(String albumsCount) {
    return '/us/rss/topalbums/limit=$albumsCount/json';
  }

}
