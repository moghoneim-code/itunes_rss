import 'package:flutter/foundation.dart';

import '../errors/custom_exceptions.dart';

T? decodeResponse<T>(
  Map<String, dynamic> data,
  Function(Map<String, dynamic> json) fromJsonModel,
) {
  try {
    return fromJsonModel(data);
  } catch (error) {
    if (kDebugMode) {
      print(error.toString());
    }
    throw DecodingError();
  }
}

List<T>? decodeResponseList<T>(
  dynamic data,
  Function(Map<String, dynamic> json) fromJsonModel,
) {
  try {
    return List<T>.from(data.map((itemsJson) => fromJsonModel(itemsJson)));
  } catch (error) {
    if (kDebugMode) {
      print(error.toString());
    }
    throw DecodingError();
  }
}
