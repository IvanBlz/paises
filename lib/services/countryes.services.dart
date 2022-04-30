import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

class RestClientServer {
  static const String _baseUrl = 'https://restcountries.com/v3.1';

  static Future<List> getCountriesAll() async {
    var url = Uri.parse("$_baseUrl/all");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future getCountries(String termino) async {
    var url = Uri.parse("$_baseUrl/name/$termino");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return [
        {"status": "error", "message": "No se encontraron paises"}
      ];
    }
  }

  static Future getCountriesByRegion(String termino) async {
    var url = Uri.parse("$_baseUrl/region/$termino");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return [
        {"status": "error", "message": "No se encontraron paises"}
      ];
    }
  }

  static Future getCountriesByCapital(String termino) async {
    var url = Uri.parse("$_baseUrl/capital/$termino");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return [
        {"status": "error", "message": "No se encontraron paises"}
      ];
    }
  }

  static Future getCountriesByAlpha(String termino) async {
    var url = Uri.parse("$_baseUrl/alpha/$termino");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return [
        {"status": "error", "message": "No se encontraron paises"}
      ];
    }
  }
}
