import 'package:http/http.dart' as http;
import 'package:rest_client/rest_client.dart';
import 'package:test/test.dart';

void main() {
  test('TokenAuthorizer.secure', () async {
    final authorizer = TokenAuthorizer(
      token: 'token',
    );

    final httpRequest = http.Request(
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
