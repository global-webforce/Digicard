import 'dart:convert';
import 'dart:io';

import 'package:validators/sanitizers.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as p;

extension LocalFileExtension on LocalFile {
  bool isNotNullOrEmpty() {
    return trim(path) != "null" && trim(path) != "";
  }

  bool doesExist() {
    bool res = false;
    try {
      if (isNotNullOrEmpty()) {
        res = io.File(path).existsSync();
      }
    } catch (e) {
      return false;
    }
    return res;
  }

  File file() {
    return File(path);
  }

  String fileType() {
    return p.extension(path);
  }
}

class LocalFile {
  final String path;

  LocalFile(
    this.path,
  );

  LocalFile copyWith({
    String? path,
  }) {
    return LocalFile(
      path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'path': path,
    };
  }

  factory LocalFile.fromMap(Map<String, dynamic> map) {
    return LocalFile(
      map['path'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalFile.fromJson(String source) =>
      LocalFile.fromMap(json.decode(source));

  @override
  String toString() => 'LocalFile(path: $path)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalFile && other.path == path;
  }

  @override
  int get hashCode => path.hashCode;
}
