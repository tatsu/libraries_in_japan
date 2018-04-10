import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartson/dartson.dart';
import 'package:libraries_in_japan/config.dart';
import 'package:libraries_in_japan/entity/library.dart';

class LibraryService {
  static const _authority = 'api.calil.jp';
  static const _path = 'library';

  final HttpClient _httpClient;

  Map<String, String> queryParameters;

  LibraryService() : _httpClient = new HttpClient();

  Future<List<Library>> getLibraries(
      {Map<String, String> queryParameters}) async {
    try {
      Map<String, String> params = {};
      if (queryParameters != null) {
        params.addAll(queryParameters);
      }
      params['appKey'] = Config.appKey;
      params['format'] = 'json';
      params['callback'] = '';

      Uri uri = new Uri.http(_authority, _path, params);
      HttpClientRequest request = await _httpClient.getUrl(uri);
      HttpClientResponse response = await request.close();
      StringBuffer buffer = new StringBuffer();
      await for (String a in response.transform(utf8.decoder)) {
        buffer.write(a);
      }
      String data = buffer.toString();
      Dartson dartson = new Dartson.JSON();
      List<Library> libraries = dartson.decode(data, new Library(), true);
      return libraries;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(dynamic e) {
    print(e);
    return new Exception('Server error; cause: $e');
  }
}
