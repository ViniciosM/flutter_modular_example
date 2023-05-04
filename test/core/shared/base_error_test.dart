import 'package:flutter_modular_example/core/shared/base_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BaseError', () async {
    var baseError = BaseError('message error');
    expect('message error', baseError.toString());
    expect(baseError.message, baseError.toString());
  });
}
