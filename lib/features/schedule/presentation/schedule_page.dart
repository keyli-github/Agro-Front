import 'package:flutter/material.dart';
import 'package:agro/shared/widgets/agro_page_layout.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const AgroPageLayout(
      title: 'Cuando aplicar',
      body: Center(child: Text("Calendario de aplicaciones")),
    );
  }
}