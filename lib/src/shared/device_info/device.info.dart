import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

Future<String> getDeviceInfo() async {
  final deviceInfo = DeviceInfoPlugin();

  if (kIsWeb) {
    final webInfo = await deviceInfo.webBrowserInfo;
    return 'Web - ${webInfo.userAgent}';
  } else if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    return 'Android - ${androidInfo.model} ${androidInfo.version.release}';
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    return 'iOS - ${iosInfo.model} ${iosInfo.systemVersion}';
  } else if (Platform.isMacOS) {
    final macosInfo = await deviceInfo.macOsInfo;
    return 'macOS - ${macosInfo.model} ${macosInfo.computerName}';
  } else if (Platform.isWindows) {
    final windowsInfo = await deviceInfo.windowsInfo;
    return 'Windows ${windowsInfo.computerName} ${windowsInfo.deviceId}';
  } else if (Platform.isLinux) {
    final linuxInfo = await deviceInfo.linuxInfo;
    return 'Linux ${linuxInfo.name} ${linuxInfo.versionId}';
  }

  return 'Device Info ${(DateTime.now())}';
}
