//lib/shared/widgets/agro_app_bar.dart
import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'notification_badge.dart';

class AgroAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool showProfile;
  final VoidCallback? onProfileTap;
  final VoidCallback? onBackTap;
  final VoidCallback? onNotificationTap;
  final bool showNotification;

  const AgroAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.showProfile = true,
    this.onProfileTap,
    this.onBackTap,
    this.onNotificationTap,
    this.showNotification = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 70,
      titleSpacing: 16,
      leading: showProfile
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF1B1B1B)),
              onPressed: onBackTap ?? () => Navigator.pop(context),
            ),
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.8,
                height: 1.1,
              ),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    height: 1.2,
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: [
        if (showNotification && showProfile)
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 4.0),
            child: Center(
              child: NotificationBadge(onTap: onNotificationTap),
            ),
          ),
        if (showProfile)
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 8.0, top: 4.0),
            child: Center(
              child: GestureDetector(
                onTap: onProfileTap,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E5E5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFF9E9E9E),
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}