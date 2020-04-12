import 'package:http/http.dart' as http;
import 'package:rest_client/rest_client.dart';
import 'package:test/test.dart';

void main() {
  test('BasicAuthorizer.secure', () {
    var authorizer = BasicAuthorizer(
      username: 'username',
      password: 'password',
    );

    var httpRequest = http.Request(
      'GET',
      Uri.parse('https://google.com'),
    );

    authorizer.secure(httpRequest);

    expect(
      httpRequest.headers['authorization'],
      'Basic dXNlcm5hbWU6cGFzc3dvcmQ=',
    );
  });

  test('BasicAuthorizer - no password', () {
    try {
      BasicAuthorizer(
        password: null,
        username: 'username',
      );
      fail('Exception should have been thrown');
    } catch (e) {
      // SUCCESS!
    }
    try {
      BasicAuthorizer(
        password: '',
        username: 'username',
      );
      fail('Exception should have been thrown');
    } catch (e) {
      // SUCCESS!
    }
  });

  test('BasicAuthorizer - no username', () {
    try {
      BasicAuthorizer(
        password: 'password',
        username: null,
      );
      fail('Exception should have been thrown');
    } catch (e) {
      // SUCCESS!
    }
    try {
      BasicAuthorizer(
        password: 'password',
        username: '',
      );
      fail('Exception should have been thrown');
    } catch (e) {
      // SUCCESS!
    }
  });
}
