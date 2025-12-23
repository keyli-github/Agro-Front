//lib/shared/widgets/primary_button.dart
import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double height;
  final Color? background;

  const PrimaryButton({
    required this.onPressed,
    required this.child,
    this.height = 56,
    this.background,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: background ?? AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 2,
        ),
        child: child,
      ),
    );
  }
}
