import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

/// 检查是否在桌面平台运行
bool isDesktop() {
  if (kIsWeb) {
    return false; // Web平台不被视为桌面平台
  }
  return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
}
