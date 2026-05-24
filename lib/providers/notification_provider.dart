import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/utils/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final notificationEnabledProvider =
    StateNotifierProvider<NotificationNotifier, bool>((ref) {
  return NotificationNotifier();
});

class NotificationNotifier extends StateNotifier<bool> {
  NotificationNotifier() : super(false) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    state = prefs.getBool('notifications_enabled') ?? false;
  }

  Future<void> toggleNotifications() async {
    state = !state;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', state);

    final notificationService = NotificationService();
    if (state) {
      await notificationService.scheduleDailyNotifications();
    } else {
      await notificationService.cancelAllNotifications();
    }
  }
}
