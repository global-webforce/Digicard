extension DynamicExtension on dynamic {
  bool isNullEmptyOrFalse() {
    if (this is Map<String, dynamic> || this is List<dynamic>) {
      return this == null || this.length == 0;
    }
    return this == null ||
        false == this ||
        "" == toString().trim() ||
        "null" == toString().trim();
  }
}
