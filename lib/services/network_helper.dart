import 'dart:convert';
import 'package:traden_app/models/service.dart';
import 'package:http/http.dart' as http;

enum Path {
  login,
  signup,
  followingServices,
}

_path(Path path) {
  switch (path) {
    case Path.login:
      return 'login/';
    case Path.signup:
      return 'profile/';
    case Path.followingServices:
      return 'services-list/';
  }
}

class NetworkHelper {
  static String baseUrl = 'http://127.0.0.1:8000/api/';

  static String url(Path path) {
    return baseUrl + _path(path);
  }

  static Future allServices(
    String token,
    completion(services, String error),
  ) async {
    var servicesResponse = await http.get(
      url(Path.followingServices),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
    );

    var servicesResponseBody = servicesResponse.body;
    if (servicesResponse.statusCode == 200) {
      var decodedServices = jsonDecode(servicesResponseBody);
      List<Service> serviceList = decodedServices
          .map<Service>((serviceJson) => Service.fromJson(serviceJson))
          .toList();
      completion(serviceList, null);
    } else {
      completion([], 'Unable to fetch services at the moment');
    }
  }

  static Future signUp({
    String name,
    String email,
    String password,
    completion(responseBody, String error),
  }) async {
    var signUpResponse = await http.post(
      url(Path.signup),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'phone': '0000000000',
        'password': password,
      }),
    );
    print(signUpResponse.statusCode);
    print(signUpResponse.body);

    var responseBody = signUpResponse.body;
    if (signUpResponse.statusCode == 201) {
      completion(jsonDecode(responseBody), null);
    } else if (signUpResponse.statusCode == 400) {
      completion(null, jsonDecode(responseBody)['error']);
    }
  }

  static Future login({
    String email,
    String password,
    completion(responseBody, String error),
  }) async {
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

    var responseBody = loginResponse.body;
    if (loginResponse.statusCode == 200) {
      completion(jsonDecode(responseBody), null);
    } else if (loginResponse.statusCode == 400) {
      completion(null, 'Unable to login with provided credentials');
    }
  }
}
