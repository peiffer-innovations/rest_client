class RequestMethod {
  const RequestMethod._(this._code);

  static const delete = RequestMethod._('DELETE');
  static const get = RequestMethod._('GET');
  static const head = RequestMethod._('head');
  static const options = RequestMethod._('OPTIONS');
  static const patch = RequestMethod._('PATCH');
  static const post = RequestMethod._('POST');
  static const put = RequestMethod._('PUT');

  static final _all = {
    delete._code: delete,
    get._code: get,
    head._code: head,
    options._code: options,
    patch._code: patch,
    post._code: post,
    put._code: put,
  };
  final String _code;

  /// Looks up the code from given string [code].  The [code] is
  /// case-insensitive.
  static RequestMethod lookup(String code) {
    final result = _all[code.toUpperCase()];

    if (result == null) {
      throw Exception('Unknown code for Request Method: [$code].');
    }

    return result;
  }

  @override
  String toString() => _code;
}
