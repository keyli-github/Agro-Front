// lib/features/community/presentation/community_screen.dart
import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'package:agro/shared/widgets/app_card.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<Map<String, String>> _posts = List.generate(
    8,
    (i) => {
      'author': 'Productor Agrícola ${i + 1}',
      'time': 'Hace ${i + 2} min • Sector Sur',
      'text':
          '¿Alguien tiene consejos para combatir la roya en el café esta temporada? Estoy probando un nuevo fertilizante orgánico.',
    },
  );

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildSlimHeader(context),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                color: AppColors.secondary,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
                  itemCount: _posts.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: AppCard(
                      padding: const EdgeInsets.all(16),
                      child: _buildPostCard(index),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showNewPostDialog(context),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 3,
        icon: const Icon(Icons.add_comment_rounded),
        label: const Text("Publicar"),
      ),
    );
  }

  Widget _buildSlimHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Comunidad',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          Row(
            children: [
              _headerButton(Icons.search, () => _showSearchDialog(context)),
              const SizedBox(width: 8),
              _headerButton(Icons.tune, () => _showOptionsMenu(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerButton(IconData icon, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white, size: 22),
      constraints: const BoxConstraints(),
      padding: const EdgeInsets.all(8),
      style: IconButton.styleFrom(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.08),
        shape: const CircleBorder(),
      ),
    );
  }

  Widget _buildPostCard(int index) {
    final post = _posts[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.secondary,
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['author']!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    post['time']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(45, 45, 45, 0.5),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.more_horiz,
              color: Color.fromRGBO(45, 45, 45, 0.3),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          post['text']!,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textDark,
            height: 1.5,
          ),
        ),
        const Divider(color: AppColors.dividerLight),
        Row(
          children: [
            _actionIcon(Icons.favorite_border, "24"),
            const SizedBox(width: 16),
            _actionIcon(Icons.chat_bubble_outline, "8"),
            const Spacer(),
            _actionIcon(Icons.share_outlined, ""),
          ],
        ),
      ],
    );
  }

  Widget _actionIcon(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.secondary),
        if (count.isNotEmpty) const SizedBox(width: 4),
        if (count.isNotEmpty)
          Text(
            count,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
      ],
    );
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.backgroundBeige,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            _menuItem(Icons.filter_list, "Filtrar por categoría"),
            _menuItem(Icons.trending_up, "Más populares"),
            _menuItem(Icons.bookmark_outline, "Mis guardados"),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {},
    );
  }

  /// 🔧 AQUÍ ESTABA EL ERROR — YA CORREGIDO
  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Buscar en la comunidad'),
        content: TextField(
          decoration: const InputDecoration(
            hintText: 'Buscar...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
  }

  void _showNewPostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        final controller = TextEditingController();

        return AlertDialog(
          title: const Text('Nueva publicación'),
          content: TextField(
            controller: controller,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Escribe lo que quieras compartir...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  setState(() {
                    _posts.insert(0, {
                      'author': 'Tú',
                      'time': 'Ahora',
                      'text': text,
                    });
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Publicar'),
            ),
          ],
        );
      },
    );
  }
}
