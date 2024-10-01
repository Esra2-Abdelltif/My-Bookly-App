
import 'package:bookly_project/core/errors/exceptions/server_exceptions/server_exceptions.dart';

class BadRequestException extends ServerExceptions {
  @override
  final String errorCode;
  @override
  final String errorMessage;
  @override
  final int statusCode;

  BadRequestException({
    required this.errorCode,
    required this.statusCode,
    required this.errorMessage,
  });
}
