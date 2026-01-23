import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/core/theme/app_theme.dart';

class NpkVerificationPage extends StatelessWidget {
  const NpkVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBeige,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          'NPK Café',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Esta es la pantalla del npk cafe',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
      ),
    );
  }
}