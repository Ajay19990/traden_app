import 'dart:convert';
import 'package:traden_app/models/category.dart';
import 'package:traden_app/models/service.dart';
import 'package:http/http.dart' as http;

enum Path {
  login,
  signup,
  allServices,
  followService,
  followingServices,
  categories,
  getServiceListByCategory,
}

_path(Path path) {
  switch (path) {
    case Path.login:
      return 'login/';
    case Path.signup:
      return 'profile/';
    case Path.allServices:
      return 'services-list/';
    case Path.followService:
      return 'follow-service';
    case Path.followingServices:
      return 'get-following-services';
    case Path.categories:
      return 'categories';
    case Path.getServiceListByCategory:
      return 'service-list-bycategories';
  }
}

class NetworkHelper {
  static String baseUrl = 'http://127.0.0.1:8000/api/';

  static String url(Path path, String param) {
    return baseUrl + _path(path) + param;
  }

  static Future getCategoryList(
    String token,
    completion(categories, String error),
  ) async {
    var categoryResponse = await http.get(
      url(Path.categories, ''),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
    );

    var categoryResponseBody = categoryResponse.body;
    if (categoryResponse.statusCode == 200) {
      var decodedServices = jsonDecode(categoryResponseBody);
      List<Category> categoryList = decodedServices
          .map<Category>((categoryJson) => Category.fromJson(categoryJson))
          .toList();
      completion(categoryList, null);
    } else {
      completion([], 'Unable to fetch services at the moment');
    }
  }

  static Future getServiceList(
    Path endPoint,
    String token,
    completion(services, String error),
  ) async {
    var servicesResponse = await http.get(
      url(endPoint, ''),
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

  static Future follow({
    String token,
    int id,
    completion(bool success, String message),
  }) async {
    var followResponse = await http.get(
      url(Path.followService, '/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
    );

    var followResponseBody = followResponse.body;
    var decodedServices = jsonDecode(followResponseBody);
    if (followResponse.statusCode == 200) {
      completion(true, decodedServices['success']);
    } else {
      completion(false, decodedServices['error']);
    }
  }

  static Future getServiceListByCategory({
    String token,
    int id,
    completion(services, String error),
  }) async {
    var servicesResponse = await http.get(
      url(Path.getServiceListByCategory, '/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
    );

    var servicesResponseBody = servicesResponse.body;
    print(servicesResponse.body);
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
      url(Path.signup, ''),
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
      url(Path.login, ''),
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
