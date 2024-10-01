import 'package:bookly_project/core/errors/exceptions/server_exceptions/failure.dart';

class ServerException extends Failure {
  @override
  final String errorMessage;
  @override
  final int statusCode;

  ServerException({
    required this.errorMessage,
    required this.statusCode,
  });
}
