import 'package:http/http.dart' as http;
import 'package:rest_client/rest_client.dart';
import 'package:test/test.dart';

void main() {
  test('TokenAuthorizer.secure', () async {
    var authorizer = TokenAuthorizer(
      token: 'token',
    );

    var httpRequest = http.Request(
      'GET',
      Uri.parse('https://google.com'),
    );

    await authorizer.secure(httpRequest);

    expect(
      httpRequest.headers['authorization'],
      'Bearer token',
    );
  });
}
