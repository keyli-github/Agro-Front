//lib/features/discover/presentation/discover_page.dart
import 'package:flutter/material.dart';
import 'package:agro/shared/widgets/app_card.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = ['Noticias', 'Técnicas', 'Mercado', 'Comunidad', 'Eventos'];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Descubre',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
            ),
            ...topics.map(
              (t) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppCard(
                  child: ListTile(
                    leading: const Icon(Icons.explore),
                    title: Text(t),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
