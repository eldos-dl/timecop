import 'dart:async';
import 'package:timecop/data_providers/data_provider.dart';
import 'package:timecop/data_providers/mock_data_provider.dart';
import 'package:timecop/data_providers/mock_settings_provider.dart';
import 'package:timecop/data_providers/settings_provider.dart';
import 'package:timecop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'dart:ui' as ui;

Future<void> main() async {
  enableFlutterDriverExtension(handler: (String text) async {
    String localeKey = ui.window.locale.languageCode;
    if(ui.window.locale.languageCode == "zh") {
      localeKey += "-" + ui.window.locale.countryCode;
    }
    return MockDataProvider.l10n[localeKey][text];
  });
  WidgetsApp.debugAllowBannerOverride = false; // remove debug banner

  final SettingsProvider settings = MockSettingsProvider();
  final DataProvider data = MockDataProvider(ui.window.locale);
  return runMain(settings, data);
}