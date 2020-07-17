import 'package:flutter/foundation.dart' show required;
import 'package:http/http.dart' as http;

import './config/index.dart' show config;

enum RequestMethod {
  GET,
  POST,
  PUT,
  PATCH,
  DELETE
}
class _Api {
  // get from login
  String _token = '';
  set token(String tok) => this._token = tok;

  Future<http.Response> request({@required RequestMethod requestMethod, @required String path, body, Map<String, String> headers}) async {
    headers ??= {};
    headers['Authorization'] = 'Bearer $_token';
    http.Response response;
    switch(requestMethod) {
      case RequestMethod.GET: {
        response = await http.get(
        '${config.baseUrl}$path',
          headers: headers
        );
      } break;
      case RequestMethod.POST: {
        response = await http.post(
        '${config.baseUrl}$path',
          headers: headers,
          body: body
        );
      } break;
      case RequestMethod.PUT: {
        response = await http.put(
        '${config.baseUrl}$path',
          headers: headers,
          body: body
        );
      } break;
      case RequestMethod.PATCH: {
        response = await http.patch(
        '${config.baseUrl}$path',
          headers: headers,
          body: body
        );
      } break;
      case RequestMethod.DELETE: {
        response = await http.delete(
        '${config.baseUrl}$path',
          headers: headers
        );
      } break;
      default: {
        throw Exception('Invalid Request Method');
      } break;
    }

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Request Failed\n');
    }
  }
}

final _Api api = _Api();