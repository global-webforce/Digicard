import 'package:flutter_test/flutter_test.dart';
import 'package:digicard/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ContactsServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
