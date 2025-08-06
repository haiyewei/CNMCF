import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../colors/app_colors.dart';
import '../settings/theme_settings_keys.dart';
import '../typography/app_typography.dart';

class ThemeProvider extends ChangeNotifier {
  // 颜色设置
  Color _primaryColor = defaultColor;
  Color _successColor = defaultSuccessColor;
  Color _warningColor = defaultWarningColor;
  Color _infoColor = defaultInfoColor;

  // 布尔值设置
  bool _isDarkMode = false;
  bool _followSystem = true;
  bool _fixedSidebar = true;
  bool _minimizeToTray = false;
  bool _askOnClose = true;
  bool _useMaterial3 = true;

  // Getters
  Color get primaryColor => _primaryColor;
  Color get successColor => _successColor;
  Color get warningColor => _warningColor;
  Color get infoColor => _infoColor;
  bool get isDarkMode => _isDarkMode;
  bool get followSystem => _followSystem;
  bool get fixedSidebar => _fixedSidebar;
  bool get minimizeToTray => _minimizeToTray;
  bool get askOnClose => _askOnClose;
  bool get useMaterial3 => _useMaterial3;

  ThemeProvider() {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final primaryColorInt = prefs.getInt(primaryColorKey);
    _primaryColor =
        primaryColorInt != null ? Color(primaryColorInt) : defaultColor;
    final successColorInt = prefs.getInt(successColorKey);
    _successColor =
        successColorInt != null ? Color(successColorInt) : defaultSuccessColor;
    final warningColorInt = prefs.getInt(warningColorKey);
    _warningColor =
        warningColorInt != null ? Color(warningColorInt) : defaultWarningColor;
    final infoColorInt = prefs.getInt(infoColorKey);
    _infoColor = infoColorInt != null ? Color(infoColorInt) : defaultInfoColor;
    _isDarkMode = prefs.getBool(darkModeKey) ?? false;
    _followSystem = prefs.getBool(followSystemKey) ?? true;
    _fixedSidebar = prefs.getBool(fixedSidebarKey) ?? true;
    _minimizeToTray = prefs.getBool(minimizeToTrayKey) ?? false;
    _askOnClose = prefs.getBool(askOnCloseKey) ?? true;
    _useMaterial3 = prefs.getBool(useMaterial3Key) ?? true;
    notifyListeners();
  }

  // Setters
  Future<void> _setColor(String key, Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, color.toARGB32());
    notifyListeners();
  }

  Future<void> _setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
    notifyListeners();
  }

  Future<void> setPrimaryColor(Color color) async {
    _primaryColor = color;
    await _setColor(primaryColorKey, color);
  }

  Future<void> setSuccessColor(Color color) async {
    _successColor = color;
    await _setColor(successColorKey, color);
  }

  Future<void> setWarningColor(Color color) async {
    _warningColor = color;
    await _setColor(warningColorKey, color);
  }

  Future<void> setInfoColor(Color color) async {
    _infoColor = color;
    await _setColor(infoColorKey, color);
  }

  Future<void> setDarkMode(bool isDarkMode) async {
    _isDarkMode = isDarkMode;
    await _setBool(darkModeKey, isDarkMode);
  }

  Future<void> setFollowSystem(bool followSystem) async {
    _followSystem = followSystem;
    await _setBool(followSystemKey, followSystem);
  }

  Future<void> setFixedSidebar(bool fixedSidebar) async {
    _fixedSidebar = fixedSidebar;
    await _setBool(fixedSidebarKey, fixedSidebar);
  }

  Future<void> setMinimizeToTray(bool minimizeToTray) async {
    _minimizeToTray = minimizeToTray;
    await _setBool(minimizeToTrayKey, minimizeToTray);
  }

  Future<void> setAskOnClose(bool askOnClose) async {
    _askOnClose = askOnClose;
    await _setBool(askOnCloseKey, askOnClose);
  }

  Future<void> setUseMaterial3(bool useMaterial3) async {
    _useMaterial3 = useMaterial3;
    await _setBool(useMaterial3Key, useMaterial3);
  }

  Future<void> resetToDefault() async {
    _primaryColor = defaultColor;
    _successColor = defaultSuccessColor;
    _warningColor = defaultWarningColor;
    _infoColor = defaultInfoColor;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(primaryColorKey);
    await prefs.remove(successColorKey);
    await prefs.remove(warningColorKey);
    await prefs.remove(infoColorKey);
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    if (_followSystem) {
      return ThemeMode.system;
    } else {
      return _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    }
  }

  ColorScheme getColorScheme({required Brightness brightness}) {
    if (_useMaterial3) {
      return ColorScheme.fromSeed(
        seedColor: _primaryColor,
        brightness: brightness,
      );
    } else {
      return ColorScheme(
        primary: _primaryColor,
        brightness: brightness,
        onPrimary: brightness == Brightness.dark ? Colors.black : Colors.white,
        secondary: _primaryColor,
        onSecondary:
            brightness == Brightness.dark ? Colors.black : Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface:
            brightness == Brightness.dark
                ? const Color(0xFF1E1E1E)
                : Colors.white,
        onSurface: brightness == Brightness.dark ? Colors.white : Colors.black,
        surfaceContainerHighest:
            brightness == Brightness.dark
                ? const Color(0xFF2D2D2D)
                : const Color(0xFFF0F0F0),
        onSurfaceVariant:
            brightness == Brightness.dark
                ? const Color(0xFFDADADA)
                : const Color(0xFF777777),
        outline:
            brightness == Brightness.dark
                ? const Color(0xFF595959)
                : const Color(0xFFBDBDBD),
        outlineVariant:
            brightness == Brightness.dark
                ? const Color(0xFF404040)
                : const Color(0xFFE0E0E0),
        shadow: Colors.black,
        scrim: Colors.black,
        surfaceTint: _primaryColor.withAlpha(26),
        inverseSurface:
            brightness == Brightness.dark
                ? Colors.white
                : const Color(0xFF121212),
        onInverseSurface:
            brightness == Brightness.dark ? Colors.black : Colors.white,
        inversePrimary:
            brightness == Brightness.dark
                ? _primaryColor.withAlpha(179)
                : HSLColor.fromColor(
                  _primaryColor,
                ).withLightness(0.3).toColor(),
        primaryContainer:
            brightness == Brightness.dark
                ? HSLColor.fromColor(
                  _primaryColor,
                ).withLightness(0.25).toColor()
                : HSLColor.fromColor(
                  _primaryColor,
                ).withLightness(0.9).toColor(),
        onPrimaryContainer:
            brightness == Brightness.dark
                ? HSLColor.fromColor(_primaryColor).withLightness(0.9).toColor()
                : HSLColor.fromColor(
                  _primaryColor,
                ).withLightness(0.1).toColor(),
        secondaryContainer:
            brightness == Brightness.dark
                ? HSLColor.fromColor(
                  _primaryColor,
                ).withLightness(0.25).withSaturation(0.4).toColor()
                : HSLColor.fromColor(
                  _primaryColor,
                ).withLightness(0.9).withSaturation(0.4).toColor(),
        onSecondaryContainer:
            brightness == Brightness.dark
                ? HSLColor.fromColor(_primaryColor).withLightness(0.9).toColor()
                : HSLColor.fromColor(
                  _primaryColor,
                ).withLightness(0.1).toColor(),
        tertiaryContainer:
            brightness == Brightness.dark
                ? HSLColor.fromColor(_primaryColor)
                    .withLightness(0.25)
                    .withSaturation(0.4)
                    .withHue((HSLColor.fromColor(_primaryColor).hue + 60) % 360)
                    .toColor()
                : HSLColor.fromColor(_primaryColor)
                    .withLightness(0.9)
                    .withSaturation(0.4)
                    .withHue((HSLColor.fromColor(_primaryColor).hue + 60) % 360)
                    .toColor(),
        onTertiaryContainer:
            brightness == Brightness.dark
                ? HSLColor.fromColor(_primaryColor).withLightness(0.9).toColor()
                : HSLColor.fromColor(
                  _primaryColor,
                ).withLightness(0.1).toColor(),
        tertiary:
            brightness == Brightness.dark
                ? HSLColor.fromColor(_primaryColor)
                    .withHue((HSLColor.fromColor(_primaryColor).hue + 60) % 360)
                    .toColor()
                : HSLColor.fromColor(_primaryColor)
                    .withHue((HSLColor.fromColor(_primaryColor).hue + 60) % 360)
                    .toColor(),
        onTertiary: brightness == Brightness.dark ? Colors.black : Colors.white,
        errorContainer:
            brightness == Brightness.dark
                ? const Color(0xFF5F1919)
                : const Color(0xFFFFDAD6),
        onErrorContainer:
            brightness == Brightness.dark
                ? const Color(0xFFFFB4AB)
                : const Color(0xFF410002),
      );
    }
  }

  Map<String, Color> getExtendedColors() {
    return {
      'success': _successColor,
      'warning': _warningColor,
      'info': _infoColor,
    };
  }

  TextTheme getAppTextTheme(TextTheme baseTheme) {
    return getTextTheme(baseTheme);
  }
}
