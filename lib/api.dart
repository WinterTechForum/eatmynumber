import 'package:http/http.dart' as http;

class API {
  String _baseURL = "https://burn451.herokuapp.com/";

  void register () async {
    String _url = _baseURL + "register";
    var response = await http.post(_url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

}