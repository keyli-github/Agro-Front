import 'package:flutter/material.dart';
import 'register_cafatal_wizard_page.dart';

// Esta página simplemente redirige al wizard
class EditCafatalProfilePage extends StatelessWidget {
  const EditCafatalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Redirigir directamente al wizard
    Future.microtask(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const RegisterCafatalWizardPage()),
      );
    });

    return const SizedBox.shrink();
  }
}
