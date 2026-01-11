import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1B3022); 
  static const Color secondary = Color(0xFF4C6D4F);
  static const Color accent = Color(0xFFF39C12); // Para el Premium
  
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
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 12, 
            fontWeight: FontWeight.w500, 
            color: AppColors.textDark
          ),
        ),
        iconTheme: WidgetStateProperty.all(
          const IconThemeData(size: 26),
        ),
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
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}