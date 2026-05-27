import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_manager/screens/bottom_navigation.dart';
import 'package:money_manager/utils/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    final notificationService = NotificationService();
    await notificationService.initNotification();
    notificationService.configureLocalTimeZone();
    await initializeDateFormatting('id', '');

    final prefs = await SharedPreferences.getInstance();
    final isEnabled = prefs.getBool('notifications_enabled') ??
        false; // default false, not true

    if (isEnabled) {
      await notificationService.scheduleDailyNotifications();
    }
  } catch (e, stack) {
    debugPrint('Startup error: $e');
    debugPrint('$stack');
  }

  runApp(const ProviderScope(child: BottomNavigation()));
}
