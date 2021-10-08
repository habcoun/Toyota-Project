import 'dart:async';
import 'package:http/http.dart' as http;

class CarApi {
  static Future getCar() {
    Uri myUri = Uri.parse("https://shoppshop.herokuapp.com/products");
    return http.get(myUri);
  }
}
