import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:rest_client/rest_client.dart';

http.Client createHttpClient({Proxy? proxy}) {
  final httpClient = HttpClient();
  if (proxy != null) {
    httpClient.findProxy = (uri) => 'PROXY ${proxy.url}';
    if (proxy.ignoreBadCertificate == true) {
      httpClient.badCertificateCallback = (_, __, ___) => true;
    }
  }

  return IOClient(httpClient);
}

Future<dynamic> processJson(String? body) async {
  dynamic responseBody;
  final receivePort = ReceivePort();
  late Isolate isolate;
  try {
    isolate = await Isolate.spawn(
      _toJsonObject,
      _IsolateJsonData(
        body: body,
        sendPort: receivePort.sendPort,
      ),
    );

    responseBody = await receivePort.first;
  } finally {
    isolate.kill();
  }

  return responseBody;
}

dynamic _toJsonObject(_IsolateJsonData data) {
  final body = data.body;
  final sendPort = data.sendPort;
  dynamic result;
  try {
    result = body == null ? null : json.decode(body);

    sendPort.send(result);
  } catch (e) {
    sendPort.send(null);
  }

  return result;
}

class _IsolateJsonData {
  _IsolateJsonData({
    this.body,
    required this.sendPort,
  });

  final String? body;
  final SendPort sendPort;
}
