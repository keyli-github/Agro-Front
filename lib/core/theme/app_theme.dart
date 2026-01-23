import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1B3022); 
  static const Color secondary = Color(0xFF4C6D4F);
  static const Color accent = Color(0xFFF39C12); // Para el Premium
  // Acción principal (botones 'Elige un desafío', indicadores)
  static const Color actionGreen = Color(0xFF0F8C77);
  
  static const Color scaffoldBeige = Color(0xFFF8F9FA); 
  static const Color surfaceWhite = Colors.white;
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textLight = Color(0xFF757575);
  static const Color error = Color(0xFFB00020);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffoldBeige,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        surface: AppColors.surfaceWhite,
        error: AppColors.error,
      ),

      // Estilo de la Barra de Navegación (Lo que tenías con error)
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.secondary.withOpacity(0.2),
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
        iconTheme: MaterialStateProperty.all(const IconThemeData(size: 26)),
      ),

      // Configuración de AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      // Tipografía
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.textDark),
        titleLarge: TextStyle(
          color: AppColors.textDark,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Reutilizable: decoración de tarjetas coherente en la app
  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: AppColors.surfaceWhite,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey[300]!, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
