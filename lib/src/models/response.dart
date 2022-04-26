import 'package:meta/meta.dart';

@immutable
class Response {
  Response({
    this.body,
    required this.headers,
    required this.statusCode,
  });

  final dynamic body;
  final Map<String, String> headers;
  final int statusCode;
}
