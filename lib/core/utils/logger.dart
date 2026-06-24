import 'package:logger/logger.dart';

abstract final class AppLogger {
  static final Logger _logger = Logger();

  static void d(dynamic message) {
    _logger.d(message);
  }

  static void e(dynamic message) {
    _logger.e(message);
  }

  static void i(dynamic message) {
    _logger.i(message);
  }

  static void w(dynamic message) {
    _logger.w(message);
  }
}
