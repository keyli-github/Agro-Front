import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/features/welcome/widgets/welcome_illustration.dart';

/// Pantalla de bienvenida que se muestra al abrir la app.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // ── Ilustración ──
              const WelcomeIllustration(size: 180),
              const SizedBox(height: 32),

              // ── Título ──
              const Text(
                '¡Bienvenido a AgroCIC!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),

              // ── Descripción ──
              const Text(
                'Centro de inteligencia del cultivo, diseñado\npara agricultores y técnicos de todo el\nPerú',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF666666),
                  height: 1.5,
                ),
              ),

              const Spacer(flex: 3),

              // ── Botón Empezar ──
              SizedBox(
                width: 220,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.go('/onboarding'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2EAF5B),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  child: const Text('Empezar'),
                ),
              ),
              const SizedBox(height: 20),

              // ── Términos y privacidad ──
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                  ),
                  children: [
                    const TextSpan(text: 'He leído y estoy de acuerdo con las '),
                    TextSpan(
                      text: 'condiciones\nde uso',
                      style: TextStyle(
                        color: const Color(0xFF2EAF5B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: ' y la '),
                    TextSpan(
                      text: 'política de privacidad',
                      style: TextStyle(
                        color: const Color(0xFF2EAF5B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
