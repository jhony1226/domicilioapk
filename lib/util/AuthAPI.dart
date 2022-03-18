import 'dart:convert';


import 'package:appdomiicilios/models/ApiString.dart';
import 'package:http/http.dart' as http;

class AuthAPI  {

  Future<http.Response> login(String email, String password) async {
    var body = jsonEncode({'email': email, 'password': password});
    http.Response response =
    await http.post(Uri.parse("${ApiStrings.url}"),  body: body);
    return response;
  }

/*
  Future<http.Response> logout(int id, String token) async {
    var body = jsonEncode({'id': id, 'token': token});

    http.Response response = await http.post(super.logoutPath,
          body: body);

    return response;
  }*/

}