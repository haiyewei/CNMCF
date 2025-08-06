import 'package:flutter/material.dart';

// 默认颜色
const Color defaultColor = Colors.blue;
const Color defaultSuccessColor = Color(0xFF4CAF50);
const Color defaultWarningColor = Color(0xFFFF9800);
const Color defaultInfoColor = Color(0xFF2196F3);

// Color 扩展
extension ColorExtension on Color {
  int toARGB32() {
    // ignore: deprecated_member_use
    return value;
  }
}
