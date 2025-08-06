import 'package:flutter/material.dart';

/// 返回一个自适应的体育场边框（胶囊形状）。
///
/// `StadiumBorder` 会自动适应其应用的小部件的高度，
/// 在其两端创建完美的半圆形。
ShapeBorder getAdaptiveStadiumBorder() {
  return const StadiumBorder();
}
