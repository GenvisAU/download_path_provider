import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class DownloadPathProvider {
  static const MethodChannel _channel =
      const MethodChannel('download_path_provider');

  static Future<Directory> get downloadsDirectory async {
    final String path = await _channel.invokeMethod('getDownloadsDirectory');
    if (path == null) {
      return null;
    }
    return Directory(path);
  }
}
