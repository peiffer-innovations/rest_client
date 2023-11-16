import 'dart:convert';

import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;
import 'package:rest_client/rest_client.dart';

http.Client createHttpClient({
  Proxy? proxy,
  bool withCredentials = false,
}) {
  final client = BrowserClient();
  client.withCredentials = withCredentials;

  return client;
}

Future<dynamic> processJson(String body) => Future.value(json.decode(body));
