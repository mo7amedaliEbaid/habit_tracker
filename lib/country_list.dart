import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchCountries() async {
  final response = await http
      .get(Uri.parse('https://restcountries.com/v3.1/all?fields=name'))
      .timeout(const Duration(seconds: 10));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    final List<String> countries = data
        .map((c) => c['name']['common'] as String)
        .toList()
      ..sort();
    return countries;
  } else {
    throw Exception('Failed to load countries (${response.statusCode})');
  }
}