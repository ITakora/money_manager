import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/screens/bottom_navigation.dart';
import 'package:money_manager/utils/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationService = NotificationService();
  notificationService.initNotification();
  notificationService.configureLocalTimeZone();
  final prefs = await SharedPreferences.getInstance();
  final isEnabled = prefs.getBool('notifications_enabled') ??
      false; // default false, not true

  if (isEnabled) {
    await notificationService.scheduleDailyNotifications();
  }

  runApp(const ProviderScope(child: BottomNavigation()));
}
