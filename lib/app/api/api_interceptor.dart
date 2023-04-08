/* import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/services/_core/app_service.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'dart:io';

class ApiInterceptor implements InterceptorContract {
  final _appService = locator<AppService>();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    try {
      request.headers[HttpHeaders.contentTypeHeader] = "application/json";
      request.headers[HttpHeaders.acceptHeader] = "application/json";
      request.headers[HttpHeaders.accessControlAllowOriginHeader] = "*";
      request.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${_appService.session?.accessToken}';
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
 */