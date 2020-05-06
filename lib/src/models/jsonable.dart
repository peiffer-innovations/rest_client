import 'dart:convert';

import 'package:logging/logging.dart';

abstract class Jsonable {
  static final Logger _logger = Logger('Jsonable');

  static bool parseBool(dynamic value) {
    var result = false;

    result = result || value == true;
    result = result || parseInt(value) == 1;
    if (result != true && value is String) {
      var lower = value.toLowerCase();
      result = result || lower == 'true';
      result = result || lower == 'yes';
    }

    return result;
  }

  static double parseDouble(dynamic value) {
    double result;
    try {
      if (value is String) {
        result = double.tryParse(value);
      } else if (value is double) {
        result = value;
      } else if (value is int) {
        result = value.toDouble();
      }
    } catch (e, stack) {
      _logger.finest('Error parsing: $value', e, stack);
    }

    return result;
  }

  static Duration parseDurationFromMillis(
    dynamic value, [
    Duration defaultValue,
  ]) {
    var millis = parseInt(value);

    return millis == null ? defaultValue : Duration(milliseconds: millis);
  }

  static Duration parseDurationFromSeconds(
    dynamic value, [
    Duration defaultValue,
  ]) {
    var seconds = parseInt(value);

    return seconds == null ? defaultValue : Duration(seconds: seconds);
  }

  static int parseInt(dynamic value) => parseDouble(value)?.toInt();

  static DateTime parseUtcMillis(dynamic value) => value == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(
          parseInt(value),
          isUtc: true,
        );

  static List<dynamic> toJsonList(List<Jsonable> list) {
    List<dynamic> result;

    if (list != null) {
      result = [];
      for (var j in list) {
        result.add(j.toJson());
      }
    }

    return result;
  }

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return json.encode(toJson());
  }
}
