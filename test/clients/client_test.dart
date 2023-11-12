import 'package:rest_client/rest_client.dart';
import 'package:test/test.dart';

void main() {
  test('binary', () async {
    const request = Request(
      method: RequestMethod.get,
      url:
          'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
    );

    final client = Client();
    final response = await client.execute(
      jsonResponse: false,
      request: request,
    );

    expect(true, response.body != null);
    expect(true, response.body.length > 0);
  });

  test(
    'interceptor',
    () async {
      const request = Request(
        method: RequestMethod.get,
        url: 'https://archive.org/metadata/principleofrelat00eins',
      );

      var client = Client(
        interceptor: Interceptor(
          onModifyRequest: (_, __) async => const Request(
            url: 'https://currentmillis.com/time/minutes-since-unix-epoch.php',
          ),
        ),
      );
      var response = await client.execute(
        request: request,
      );

      expect(true, response.body != null);
      expect(true, int.parse(response.body) > 0);
      expect(response.statusCode, 200);

      client = Client(
        interceptor: Interceptor(
          onInterceptRequest: (_, __) async => const Response(
            body: 'Intercepted',
            headers: {
              'content-type': 'text/plain',
            },
            statusCode: 201,
          ),
        ),
      );
      response = await client.execute(
        jsonResponse: false,
        request: request,
      );
      expect(response.body, 'Intercepted');
      expect(response.statusCode, 201);

      client = Client(
        interceptor: Interceptor(
          onModifyResponse: (_, __, ___) async => const Response(
            body: 'Modified',
            headers: {
              'content-type': 'text/plain',
            },
            statusCode: 202,
          ),
        ),
      );
      response = await client.execute(
        request: request,
      );
      expect(true, response.body == 'Modified');
      expect(response.statusCode, 202);
    },
  );

  test('success', () async {
    const request = Request(
      method: RequestMethod.get,
      url: 'https://archive.org/metadata/principleofrelat00eins',
    );

    final client = Client();
    final response = await client.execute(request: request);

    expect(true, response.body != null);
    expect(true, response.body is Map);
  });
}
