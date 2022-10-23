import 'package:rest_client/rest_client.dart';

/// An request / response interceptor that can modify a [Request], intercept a
/// [Request], or modify a [Response].
class Interceptor {
  Interceptor({
    this.onInterceptRequest,
    this.onModifyRequest,
    this.onModifyResponse,
  });

  Future<Response?> Function(Client client, Request request)?
      onInterceptRequest;
  Future<Request> Function(Client client, Request request)? onModifyRequest;
  Future<Response> Function(
    Client client,
    Request request,
    Response response,
  )? onModifyResponse;

  /// Concrete classes can implement this function to intercept a request.  If
  /// this returns null then the [Client] will attempt to execute the request.
  ///
  /// If this returns a non-null [Response] then the client will use the
  /// returned value as if it was the actual response of the [Request].
  Future<Response?> interceptRequest(
    Client client,
    Request request,
  ) =>
      onInterceptRequest == null
          ? Future.value(null)
          : onInterceptRequest!(client, request);

  /// Concrete classes can implement this function to modify the request before
  /// it is executed.  This will be called before [interceptRequest] so if
  Future<Request> modifyRequest(Client client, Request request) =>
      onModifyRequest == null
          ? Future.value(request)
          : onModifyRequest!(client, request);

  /// Concrete classes can implement this function to intercept a response.  The
  /// returned value will be used as the [Response] of the [Client].
  Future<Response> modifyResponse(
    Client client,
    Request request,
    Response response,
  ) =>
      onModifyResponse == null
          ? Future.value(response)
          : onModifyResponse!(client, request, response);
}
