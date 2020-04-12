import 'dart:convert';

import 'package:rest_client/rest_client.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Authorizor that supports BASIC HTTP Authentication.
@immutable
class BasicAuthorizer extends Authorizer {
  /// Creates the authorizer with the given username and password.
  BasicAuthorizer({
    @required this.password,
    @required this.username,
  })  : assert(password?.isNotEmpty == true),
        assert(username?.isNotEmpty == true);

  final String password;
  final String username;

  /// Secures the request by adding the basic `authorization` header with the
  /// base64 encoded version of the [username] and [password].
  @override
  void secure(http.Request httpRequest) {
    assert(httpRequest != null);
    var b64 = base64.encode(utf8.encode('$username:$password'));

    httpRequest.headers['authorization'] = 'Basic $b64';
  }
}
