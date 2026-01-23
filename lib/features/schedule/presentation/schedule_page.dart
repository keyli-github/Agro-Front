import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/shared/widgets/agro_page_layout.dart';
import 'package:agro/core/theme/app_theme.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AgroPageLayout(
      title: 'Cuando aplicar',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}