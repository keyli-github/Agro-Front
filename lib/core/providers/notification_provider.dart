// lib/core/providers/notification_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationState {
  final int count;
  final bool isVisible;

  NotificationState({this.count = 0, this.isVisible = true});

  NotificationState copyWith({int? count, bool? isVisible}) {
    return NotificationState(
      count: count ?? this.count,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

// Provider simple para el estado de notificaciones
final notificationProvider = StateProvider<NotificationState>((ref) {
  return NotificationState(count: 1);
});
