import 'package:date_wrapper/date.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Compare dates', () {
    final first = Date(2022, 8, 22);
    final second = Date.of(DateTime(2022, 8, 22, 23, 10));
    expect(first.isBefore(second), false);
    expect(first.isAfter(second), false);
    expect(first == second, true);
  });
}
