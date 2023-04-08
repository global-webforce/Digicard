import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

extension IsOk on http.Response {
  bool get ok {
    return (statusCode ~/ 100) == 2;
  }
}

class ApiService {
  http.Client client = InterceptedClient.build(
    interceptors: [
      //  ApiInterceptor(),
    ],
  );

  errorMessage(String? message) {
    final String error = "$message";
    if (error.isEmpty) {
      return Future.error("Unknown error");
    }
    if (error.contains("XMLHttpRequest error")) {
      //  x.logOut();
      return Future.error("Network request failed");
    }
    if (error.contains("Invalid Credentials")) {
      return Future.error("Invalid Credentials");
    }
    if (error.contains("Failed host lookup")) {
      return Future.error("Check your internet connection");
    }
    if (error.contains("The email has already been taken")) {
      return Future.error("The email has already been taken");
    }
    if (error.contains("Unauthenticated")) {
      return Future.error("Session expired");
    }
    if (error.contains("Connection closed before full header was received")) {
      return Future.value();
    }
    return Future.error(error);
  }

  Future get(
    String url, {
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      return await client.get(Uri.parse(url)).then((res) {
        if (res.ok) {
          return onSuccess(res);
        } else {
          return Future.error(
              "${res.body.toString()} ${res.statusCode.toString()}");
        }
      });
    } catch (e) {
      onError("");
      return errorMessage("$e");
    }
  }

  Future postFile(
    String url, {
    Map<String, dynamic> requestBody = const {},
    List<MultipartFile> files = const [],
    required Function(Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      Map<String, String> s = <String, String>{};
      requestBody.forEach((key, value) => s[key] = value.toString());

      request.fields.addAll(s);

      for (var element in files) {
        request.files.add(element);
      }
      return await request.send().then((res) async {
        http.Response.fromStream(res).then((response) {
          if ((res.statusCode ~/ 100) == 2) {
            onSuccess(response);
          } else {
            return Future.error(res.toString());
          }
        });
      });
    } catch (e) {
      onError("");
      return errorMessage("$e");
    }
  }

  Future post(
    String url, {
    Map<String, dynamic>? requestBody,
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      await client
          .post(
        Uri.parse(url),
        body: (requestBody != null) ? jsonEncode(requestBody) : null,
      )
          .then((res) {
        if (res.ok) {
          onSuccess(res);
        } else {
          return Future.error(res.body.toString());
        }
      });
    } catch (e) {
      onError("");
      return errorMessage("$e");
    }
  }

  Future postWithSingleImageUpload(
    String url, {
    Map<String, dynamic>? requestBody,
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      await client
          .post(
        Uri.parse(url),
        body: (requestBody != null) ? jsonEncode(requestBody) : null,
      )
          .then((res) {
        if (res.ok) {
          onSuccess(res);
        } else {
          return Future.error(res.body.toString());
        }
      });
    } catch (e) {
      onError("");
      return errorMessage("$e");
    }
  }

  Future put(
    String url, {
    Map<String, dynamic>? requestBody,
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      return await client
          .put(
        Uri.parse(url),
        body: (requestBody != null) ? jsonEncode(requestBody) : null,
      )
          .then((res) {
        if (res.ok) {
          onSuccess(res);
        } else {
          return Future.error(res.body.toString());
        }
      });
    } catch (e) {
      onError("");
      return errorMessage("$e");
    }
  }

  Future delete(
    String url, {
    Map<String, dynamic>? requestBody,
    required Function(http.Response res) onSuccess,
    required Function(String errorMessage) onError,
  }) async {
    try {
      await client
          .delete(
        Uri.parse(url),
        body: (requestBody != null) ? jsonEncode(requestBody) : null,
      )
          .then((res) {
        if (res.ok) {
          onSuccess(res);
        } else {
          return Future.error(res.body.toString());
        }
      });
    } catch (e) {
      onError("");
      return errorMessage("$e");
    }
  }
}
