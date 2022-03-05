import 'package:rest_client/rest_client.dart';
import 'package:test/test.dart';

void main() {
  test('binary', () async {
    var request = Request(
      method: RequestMethod.get,
      url:
          'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
    );

    var client = Client();
    var response = await client.execute(
      jsonResponse: false,
      request: request,
    );

    expect(true, response.body != null);
    expect(true, response.body.length > 0);
  });

  test('success', () async {
    var request = Request(
      method: RequestMethod.get,
      url: 'https://archive.org/metadata/principleofrelat00eins',
    );

    var client = Client();
    var response = await client.execute(request: request);

    expect(true, response.body != null);
    expect(true, response.body is Map);
  });
}
