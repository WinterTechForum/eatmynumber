import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class API {
  String _baseURL = "https://burn451.herokuapp.com/";
  final storage = new FlutterSecureStorage();

  Future<bool> register () async {
    String _url = _baseURL + "register";
    var response = await http.post(_url);
    print('Response status: ${response.statusCode}');
    if(response.statusCode != 200) return false;
    print('Response body: ${response.body}');
    await storage.write(key: "userToken", value: jsonDecode(response.body)["token"]);
    return true;
  }

  void initLease() async {
    var token = await storage.read(key: "userToken");
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    //POST (check out a number), input {"user_number": "..."}, return {"lease_id": "...", "leased_number": "...", "ttl": ###}
    var response = await http.post(_baseURL + 'lease',
        headers: headers,
        body: {'user_number': 'TODO: put number here'});

    print('Response status: ${response.statusCode}');
    Map<String, dynamic> jsonData = json.decode(response.body);

    print('Response body: ${jsonData["lease_id"]}');
    print('Response body: ${jsonData['leased_number']}');
    print('Response body: ${jsonData['ttl']}');
  }

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

    Map<String, dynamic> jsonData = json.decode(response.body);
    print('Response body: ${jsonData["balance"]}');
    return jsonData["balance"];
  }

  Future<int> addFunds(int seconds) async {
    String token = await storage.read(key: "userToken");
    var response = await http.post(_baseURL+"balance", body: json.encode({"seconds": seconds}), headers: {"Authorization": "Bearer $token"});
    if (response.statusCode != 200) {
      print("Response: ${response.statusCode}");
      print("Failed to add to balance!");
      return 0;
    }

    Map<String, dynamic> jsonData = json.decode(response.body);
    print('Response body: ${jsonData["balance"]}');
    return jsonData["balance"];
  }
}
