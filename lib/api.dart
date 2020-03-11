import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class API {
  String _baseURL = "https://burn451.herokuapp.com/";
  final storage = new FlutterSecureStorage();

  Future<bool> register () async {
    String _url = _baseURL + "register";
    var response = await http.post(_url);
    print('Response status: ${response.statusCode}');
    if(response.statusCode != 200) return false;
    print('Response body: ${response.body}');
    await storage.write(key: "userData", value: jsonDecode(response.body)["token"]);
    return true;
  }

  void initLease(){

  }

  void extendLease(){

  }

  void endLease(){

  }

  void checkFunds(){

  }

  void addFunds() {

  }
}