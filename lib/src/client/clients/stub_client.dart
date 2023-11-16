import 'package:http/http.dart' as http;
import 'package:rest_client/rest_client.dart';

http.Client createHttpClient({
  Proxy? proxy,
  bool withCredentials = false,
}) =>
    throw UnimplementedError();

Future<dynamic> processJson(String? body) => throw UnimplementedError();

bool shouldSpawnIsolate() => throw UnimplementedError();
