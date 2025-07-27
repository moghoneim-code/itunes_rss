class NoInternetError implements Exception {
  final String message;

  NoInternetError({this.message = 'No internet connection'});

  @override
  String toString() => message;
}

class DecodingError implements Exception {
  final String message;

  DecodingError({this.message = 'Decoding error occurred'});

  @override
  String toString() => message;
}
