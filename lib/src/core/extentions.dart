import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

extension DoubleX on double {
  double percent(double value) => (this / 100) * value;
}

extension StringX on String {
  String limitStringLength(int value) {
    if (length > value) return '${substring(0, value)}...';

    return this;
  }
}
