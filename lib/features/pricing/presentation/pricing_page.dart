import 'package:flutter/material.dart';
import 'package:agro/shared/widgets/agro_page_layout.dart';

class PricingPage extends StatelessWidget {
  const PricingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const AgroPageLayout(
      title: 'Precio y productos',
      body: Center(child: Text("Listado de precios y mercado")),
    );
  }
}