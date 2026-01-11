import 'package:flutter/material.dart';
import 'package:agro/shared/widgets/agro_page_layout.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const AgroPageLayout(
      title: 'Premium',
      body: Center(child: Icon(Icons.workspace_premium, size: 100, color: Colors.orange)),
    );
  }
}