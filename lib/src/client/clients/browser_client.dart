import 'dart:convert';
import 'package:rest_client/rest_client.dart';
import 'package:http/http.dart' as http;

http.Client createHttpClient({Proxy proxy}) => http.Client();

Future<dynamic> processJson(String body) => Future.value(json.decode(body));

bool shouldSpawnIsolate() => false;
