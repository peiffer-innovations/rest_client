import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'request_method.dart';

@immutable
class Request {
  const Request({
    this.body,
    this.headers,
    RequestMethod? method,
    required this.url,
  }) : method =
            method ?? (body == null ? RequestMethod.get : RequestMethod.post);

  final String? body;
  final Map<String, String>? headers;
  final RequestMethod method;
  final String url;

  /// Prepares the headers from the request to send.  This will automatically
  /// apply the `content-type` header and the `accept` header if not already
  /// set.
  Map<String, String> prepareHeaders() {
    final headers = <String, String>{};
    if (this.headers != null) {
      this.headers!.forEach((key, value) {
        headers[key.toLowerCase()] = value;
      });
    }

    if (headers['accept']?.isNotEmpty != true) {
      headers['accept'] = 'application/json';
    }
    if (body?.isNotEmpty == true && !headers.containsKey('content-type')) {
      headers['content-type'] = 'application/json';
    }

    if (!headers.containsKey('accept-language')) {
      headers['accept-language'] = Intl.defaultLocale ?? 'en_US';
    }
    headers.removeWhere((key, value) => value.isEmpty);

    return headers;
  }

  Request copyWith({
    String? body,
    Map<String, String>? headers,
    RequestMethod? method,
    String? url,
  }) =>
      Request(
        body: body ?? this.body,
        headers: headers ?? this.headers,
        method: method ?? this.method,
        url: url ?? this.url,
      );
}
