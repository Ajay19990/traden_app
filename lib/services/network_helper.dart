import 'dart:convert';

import 'package:http/http.dart' as http;

enum Path {
  login,
  signup,
}

_path(Path path) {
  switch (path) {
    case Path.login:
      return 'login/';
    case Path.signup:
      return '';
  }
}

class NetworkHelper {
  static String baseUrl = 'http://127.0.0.1:8000/api/';

  static String url(Path path) {
    return baseUrl + _path(path);
  }

  static Future login(
      {String email,
      String password,
      completion(String responseBody, String error)}) async {
    var loginResponse = await http.post(
      url(Path.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': email,
        'password': password,
      }),
    );

    if (loginResponse.statusCode == 200) {
      var responseBody = loginResponse.body;
      completion(responseBody, null);
    } else if (loginResponse.statusCode == 400) {
      completion(null, 'Unable to login with provided credentials');
    }
  }
}
