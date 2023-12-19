import 'dart:core';
import 'package:dio/dio.dart';

abstract class NetworkServiceConnectionError implements Exception {
  NetworkServiceConnectionError();

  @override
  String toString() {
    return runtimeType.toString();
  }
}

class InternetConnectionError extends NetworkServiceConnectionError {}

abstract class RestRequestError implements Exception {
  @override
  String toString() {
    return runtimeType.toString();
  }
}

abstract class RestResponseError implements Exception {
  final int statusCode;
  final String? responseUrl;
  final Response? response;

  RestResponseError({
    required this.statusCode,
    this.responseUrl,
    this.response,
  });

  @override
  String toString() {
    Map<String, String> values = {};
    values["type"] = runtimeType.toString();
    values['statusCode'] = statusCode.toString();
    values['responseUrl'] = responseUrl ?? 'noResponseUrl';
    return values.toString();
  }
}

class ConnectionTimeoutError extends RestRequestError {}

class ConnectionError extends RestRequestError {}

class ReceiveTimeoutError extends RestRequestError {}

class RequestCanceledError extends RestRequestError {}

class SendTimeoutError extends RestRequestError {}

class ClientServerError extends RestResponseError {
  ClientServerError({
    required super.statusCode,
    super.response,
    super.responseUrl,
  });
}

class InternalServerError extends RestResponseError {
  InternalServerError({
    required super.statusCode,
    super.response,
    super.responseUrl,
  });
}

class UnexpectedError implements Exception {}

class NoDataException implements Exception {}

