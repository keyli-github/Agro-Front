// lib/features/errors/domain/entities/action_item.dart

class ActionItem {
  final String id;
  final String title;
  final String icon;
  final VoidCallback onTap;

  ActionItem({
    required this.id,
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

typedef VoidCallback = void Function();
