import 'dart:async';
import 'package:bookly_project/core/errors/exceptions/server_exceptions/server_exception.dart';
import 'package:bookly_project/core/services/remote/api/books_api_constantace.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


abstract class ApiHelper {
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    bool isMultipart = false,

  });

  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    dynamic options,
    String? token,
    bool isMultipart = false,
  });

  Future<dynamic> put({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    bool isMultipart = false,
    dynamic options,

  });

  Future<dynamic> patch({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    bool isMultipart = false,
    dynamic options,

  });

  Future<dynamic> delete({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    bool isMultipart = false,

  });
}

extension RequestFunction on ApiHelper {
  Future requestData({
    required Future<Response> Function() call,
  }) async {
    try {
      final response = await call();
      debugPrint("Response_Data => ${response.data}");
      debugPrint("Response_Type => ${response.data.runtimeType}");
      debugPrint("Response_Code => ${response.statusCode}");

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ServerException(
            statusCode: timeoutStatusCode,
            errorMessage: "Connection timeout with ApiServer"
        );
      } else if (e.type == DioExceptionType.sendTimeout) {
        throw ServerException(
            statusCode: timeoutStatusCode,
            errorMessage: "Send timeout with ApiServer"
        );
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw ServerException(
            statusCode: timeoutStatusCode,
            errorMessage: "Receive timeout with ApiServer"
        );
      }
      else if (e.type == DioExceptionType.cancel) {
        throw ServerException(
            statusCode: timeoutStatusCode,
            errorMessage: "Request to ApiServer was canceld"
        );
      }
      else {
        _handleThrowingExceptions(e);
      }
    }
  }

  void _handleThrowingExceptions(DioException e) {
    if (e.response!.statusCode == badRequestStatusCode ||
        e.response!.statusCode == unAuthorizedStatusCode ||
        e.response!.statusCode == forbiddenStatusCode) {
      throw ServerException(
        errorMessage: e.response!.data['error']['message'],
        statusCode: e.response!.data['code'],
      );
    }

    else if (e.response!.statusCode == internalServerErrorStatusCode) {
      throw ServerException(
        statusCode: internalServerErrorStatusCode,
        errorMessage: "Internal Server error, Please try later",
      );
    }

    else if (e.response!.statusCode == notFoundStatusCode) {
      throw ServerException(
        errorMessage: "Your request not found, Please try later!",
        statusCode: notFoundStatusCode,
      );
    }
    else  {
      throw ServerException(
        errorMessage: 'Opps There was an Error, Please try again',
        statusCode: e.response!.data['code'],);
    }
  }
}

