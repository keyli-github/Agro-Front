import 'package:flutter/material.dart';
import 'package:agro/shared/widgets/agro_page_layout.dart';

class ErrorsPage extends StatelessWidget {
  const ErrorsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const AgroPageLayout(
      title: 'Evitar errores',
      body: Center(child: Text("Contenido para evitar errores")),
    );
  }
}
