import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Correo electrónico', style: TextStyle(color: AppColors.textDark)),
        backgroundColor: AppColors.surfaceWhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColors.scaffoldBeige,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
          child: Column(
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  color: AppColors.surfaceWhite,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Center(
                  child: Icon(Icons.mail_outline, size: 40, color: AppColors.actionGreen),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'El correo electrónico te ayuda a acceder a tu cuenta, así como ser el primero en enterarte de las nuevas tendencias',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 22),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  filled: true,
                  fillColor: AppColors.surfaceWhite,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: 220,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: implement verification flow
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Verificar correo electrónico (simulado)')));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surfaceWhite,
                    side: const BorderSide(color: AppColors.actionGreen),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Verificar correo electrónico', style: TextStyle(color: AppColors.actionGreen)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
