import 'package:http/http.dart' as http;
const String baseUrl = "http://192.168.0.3:8080";

final http.Client httpClient = http.Client();

Map<String, String> getHeaders() {
  return {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
    "accept": "application/json",
  };
}

Future<http.Response> post(String url, String body) async {
  final headers = getHeaders();
  final response = await httpClient.post(Uri.parse('$baseUrl$url'),
      headers: headers, body: body);
  return response;
}
