import 'package:json_class/json_class.dart';

/// Deprecated; use [JsonClass] directly instead.
@deprecated
abstract class Jsonable extends JsonClass {
  /// Deprecated; use [JsonClass] directly instead.
  @deprecated
  static bool parseBool(dynamic value) => JsonClass.parseBool(value);

  /// Deprecated; use [JsonClass] directly instead.
  @deprecated
  static double parseDouble(
    dynamic value, [
    double defaultValue,
  ]) =>
      JsonClass.parseDouble(value);

  /// Deprecated; use [JsonClass] directly instead.
  @deprecated
  static Duration parseDurationFromMillis(
    dynamic value, [
    Duration defaultValue,
  ]) =>
      JsonClass.parseDurationFromMillis(value, defaultValue);

  /// Deprecated; use [JsonClass] directly instead.
  @deprecated
  static Duration parseDurationFromSeconds(
    dynamic value, [
    Duration defaultValue,
  ]) =>
      JsonClass.parseDurationFromSeconds(value, defaultValue);

  /// Deprecated; use [JsonClass] directly instead.
  @deprecated
  static int parseInt(
    dynamic value, [
    int defaultValue,
  ]) =>
      JsonClass.parseInt(value);

  /// Deprecated; use [JsonClass] directly instead.
  @deprecated
  static DateTime parseUtcMillis(
    dynamic value, [
    int defaultValue,
  ]) =>
      JsonClass.parseUtcMillis(value, defaultValue);

  /// Deprecated; use [JsonClass] directly instead.
  @deprecated
  static List<dynamic> toJsonList(List<JsonClass> list) =>
      JsonClass.toJsonList(list);
}
