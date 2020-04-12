import 'package:meta/meta.dart';

import 'response.dart';

@immutable
class RestException implements Exception {
  const RestException({
    @required this.response,
    @required this.message,
  }) : assert(response != null);

  final String message;
  final Response response;

  @override
  String toString() => 'RestException: $message';
}
