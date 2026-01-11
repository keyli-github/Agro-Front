//lib/shared/widgets/agro_page_layout.dart
import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class AgroPageLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? headerExtra;

  const AgroPageLayout({
    super.key,
    required this.title,
    required this.body,
    this.headerExtra,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (headerExtra != null) headerExtra!,
        Expanded(
          child: Container(
            width: double.infinity,
            color: AppColors.scaffoldBeige,
            child: body,
          ),
        ),
      ],
    );
  }
}
