import 'package:flutter/material.dart';
import 'package:chinese_font_library/chinese_font_library.dart';
import 'dart:ui' as ui;
import 'dart:io' show Platform;

/// 创建TextTheme
TextTheme getTextTheme(TextTheme baseTheme) {
  final fontFamily = getFontFamily();

  // 使用系统中文字体并为每个样式单独应用
  return baseTheme.copyWith(
    displayLarge:
        baseTheme.displayLarge
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 400)],
            )
            .useSystemChineseFont(),
    displayMedium:
        baseTheme.displayMedium
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 400)],
            )
            .useSystemChineseFont(),
    displaySmall:
        baseTheme.displaySmall
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 400)],
            )
            .useSystemChineseFont(),
    headlineLarge:
        baseTheme.headlineLarge
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
    headlineMedium:
        baseTheme.headlineMedium
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
    headlineSmall:
        baseTheme.headlineSmall
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
    titleLarge:
        baseTheme.titleLarge
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
    titleMedium:
        baseTheme.titleMedium
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
    titleSmall:
        baseTheme.titleSmall
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
    bodyLarge:
        baseTheme.bodyLarge
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 400)],
            )
            .useSystemChineseFont(),
    bodyMedium:
        baseTheme.bodyMedium
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 400)],
            )
            .useSystemChineseFont(),
    bodySmall:
        baseTheme.bodySmall
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 400)],
            )
            .useSystemChineseFont(),
    labelLarge:
        baseTheme.labelLarge
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
    labelMedium:
        baseTheme.labelMedium
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
    labelSmall:
        baseTheme.labelSmall
            ?.copyWith(
              fontFamily: fontFamily,
              fontVariations: const [FontVariation('wght', 500)],
            )
            .useSystemChineseFont(),
  );
}

/// 获取ThemeData中的字体设置
String getFontFamily() {
  // 不再指定具体字体，返回空字符串让系统使用默认字体
  return '';
}

/// 判断当前是否使用中文
bool isChineseLanguage() {
  // 检查系统语言
  final locale = ui.PlatformDispatcher.instance.locale;
  final languageCode = locale.languageCode;

  // 如果语言代码是zh则为中文
  if (languageCode == 'zh') {
    return true;
  }

  // 如果系统语言不是中文，但在中文环境的平台上，也返回中文字体
  if (Platform.isWindows || Platform.isAndroid || Platform.isLinux) {
    // 这些平台中文环境更常见，保险起见也使用中文字体
    return true;
  }

  return false;
}
