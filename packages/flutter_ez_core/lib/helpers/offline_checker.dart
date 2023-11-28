import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<bool> hasNetwork() async {
  const String knownUrl = 'example.com';
  if (kIsWeb) {
    return _hasNetworkWeb(knownUrl);
  } else {
    return _hasNetworkMobile(knownUrl);
  }
}

Future<bool> _hasNetworkWeb(String knownUrl) async {
  try {
    final result = await http.get(Uri.parse(knownUrl));
    if (result.statusCode == 200) return true;
  } on SocketException catch (_) {}
  return false;
}

Future<bool> _hasNetworkMobile(String knownUrl) async {
  try {
    final result = await InternetAddress.lookup(knownUrl);
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {}
  return false;
}
