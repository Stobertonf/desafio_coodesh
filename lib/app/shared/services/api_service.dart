import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

enum ApiServiceType { post, get, put, delete, patch }

class ApiService {

  
}

class HttpParams {
  final ApiServiceType? apiType;
  final String? endpoint;
  String? authorization;
  final Map<String, String>? headers;
  final Map<String, dynamic>? body;
  final int? timeoutInMilliseconds;
  final Function? progressCallback;
  final CancelToken? cancelToken;
  final ResponseType? responseType;
  final Function(int received, int total)? onReceiveProgress;

  HttpParams({
    required this.apiType,
    required this.endpoint,
    this.timeoutInMilliseconds = 10000,
    this.authorization,
    this.body,
    this.headers,
    this.progressCallback,
    this.cancelToken,
    this.onReceiveProgress,
    this.responseType,
  });

  String get method {
    if (apiType == ApiServiceType.get) {
      return 'GET';
    } else if (apiType == ApiServiceType.post) {
      return 'POST';
    } else if (apiType == ApiServiceType.put) {
      return 'PUT';
    } else if (apiType == ApiServiceType.delete) {
      return 'DELETE';
    } else if (apiType == ApiServiceType.patch) {
      return 'PATCH';
    } else {
      return 'NO_METHOD';
    }
  }
}
