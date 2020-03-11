import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class API {
  String _baseURL = "https://burn451.herokuapp.com/";
  final storage = new FlutterSecureStorage();

  void register() {}

  void initLease() {}

  void extendLease() {}

  void endLease() {}

  Future<int> checkFunds() async {
    String token = await storage.read(key: "userToken");
    var response = await http.get(_baseURL+"balance", headers: {"Authorization": "Bearer $token"});
    if (response.statusCode != 200) {
      print("Response: ${response.statusCode}");
      print("Failed to get balance!");
      return 0;
    }

    return int.parse(json.decode(response.body).balance);
  }

  Future<int> addFunds(int seconds) async {
    String token = await storage.read(key: "userToken");
    var response = await http.post(_baseURL+"balance", body: {"seconds": seconds}, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode != 200) {
      print("Failed to add balance!");
      return 0;
    }

    return int.parse(json.decode(response.body).balance);
  }
}
