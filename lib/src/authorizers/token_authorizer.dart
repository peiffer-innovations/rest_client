import 'package:rest_client/rest_client.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Authorizor to provide `Bearer` tokents.
@immutable
class TokenAuthorizer extends Authorizer {
  /// Constructs the authorizer with the given token to pass to the back end.
  TokenAuthorizer({
    @required this.token,
  }) : assert(token?.isNotEmpty == true);

  final String token;

  /// Attaches the token as a `Bearer` token to the `authorization` header.
  @override
  void secure(http.Request httpRequest) {
    assert(httpRequest != null);

    httpRequest.headers['authorization'] = 'Bearer $token';
  }
}
