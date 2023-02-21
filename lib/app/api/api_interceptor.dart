import 'package:http_interceptor/http_interceptor.dart';
import 'package:digicard/app/app.locator.dart';
import 'dart:io';

import 'package:digicard/app/core/local_storage/local_storage_service.dart';

class ApiInterceptor implements InterceptorContract {
  final _localStorageService = locator<LocalStorageService>();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    try {
      request.headers[HttpHeaders.contentTypeHeader] = "application/json";
      request.headers[HttpHeaders.acceptHeader] = "application/json";
      request.headers[HttpHeaders.accessControlAllowOriginHeader] = "*";
      request.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${_localStorageService.token}';
    } catch (e) {
      rethrow;
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() {
    return Future.value(true);
  }

  @override
  Future<bool> shouldInterceptResponse() {
    return Future.value(true);
  }
}

class ExpiredTokenRetryPolicy extends RetryPolicy {
  @override
  Future<bool> shouldAttemptRetryOnResponse(BaseResponse response) async {
    if (response.statusCode == 401) {
      return true;
    }

    return false;
  }
}
