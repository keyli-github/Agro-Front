import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:agro/core/theme/app_theme.dart';

// Proveedor para manejar el estado de la pestaña seleccionada (0: Comprar, 1: Mis tickets)
final selectedTabProvider = StateProvider<int>((ref) => 0);

// Proveedor para manejar la cantidad de tickets a comprar
final ticketQuantityProvider = StateProvider<int>((ref) => 1);

class RewardsPage extends ConsumerWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    final ticketQuantity = ref.watch(ticketQuantityProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 18),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            // 1. Banner Superior (Cinta Oro)
            _buildGoldBanner(),

            const SizedBox(height: 25),

            // 2. Selector de Tabs
            _buildToggleTabs(ref, selectedTab),

            const SizedBox(height: 40), 

            // 3. Contenido condicional (Sección puntiaguda)
            selectedTab == 0 
                ? _buildEnhancedPurchaseSection(ref, ticketQuantity) 
                : _buildMyTicketsSection(),

            // SECCIÓN DE COMPRA (Solo si pestaña 0 está activa)
            if (selectedTab == 0) ...[
              // --- SEPARACIÓN AUMENTADA AQUÍ ---
              const SizedBox(height: 45), 
              _buildPriceTag(),
              const SizedBox(height: 30),
              _buildSpecialOffersSection(),
            ],

            const SizedBox(height: 20),

            // 6. Tarjeta del Gran Sorteo
            _buildRaffleTicketCard(),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS DE APOYO ---

  Widget _buildGoldBanner() {
    return Center(
      child: ClipPath(
        clipper: RibbonClipper(),
        child: CustomPaint(
          painter: DiamondPainter(),
          child: Container(
            width: 280,
            height: 70,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE8C766), Color(0xFFD4AF37), Color(0xFFF9E79F), Color(0xFFB8860B)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('¡Gran Sorteo!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                Text('21 de Mayo del 2026', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleTabs(WidgetRef ref, int selectedIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          _tabButton(
            label: 'Comprar tickets',
            isActive: selectedIndex == 0,
            onTap: () => ref.read(selectedTabProvider.notifier).state = 0,
          ),
          const SizedBox(width: 10),
          _tabButton(
            label: 'Mis tickets',
            isActive: selectedIndex == 1,
            onTap: () => ref.read(selectedTabProvider.notifier).state = 1,
          ),
        ],
      ),
    );
  }

  Widget _tabButton({required String label, required bool isActive, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? AppColors.actionGreen : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isActive ? Colors.transparent : Colors.grey.shade200),
            boxShadow: isActive ? [BoxShadow(color: AppColors.actionGreen.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))] : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: isActive ? Colors.white : AppColors.actionGreen, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedPurchaseSection(WidgetRef ref, int ticketQuantity) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomPaint(
            painter: PointyBorderPainter(color: AppColors.actionGreen),
            child: ClipPath(
              clipper: PointyClipper(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.flash_on, color: Colors.amber.shade700, size: 14),
                          const SizedBox(width: 4),
                          const Text('Monedas disponibles', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('1', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: AppColors.actionGreen)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40), child: Divider(color: Color(0xFFF0F0F0), thickness: 1)),
                    const Text('¿Cuántos tickets quieres comprar?', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54)),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _quantityButton(Icons.remove_rounded, () {
                          if (ticketQuantity > 1) {
                            ref.read(ticketQuantityProvider.notifier).state = ticketQuantity - 1;
                          }
                        }),
                        Container(
                          width: 90, height: 38,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.actionGreen.withOpacity(0.3), width: 1.5)),
                          child: Center(child: Text('$ticketQuantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                        ),
                        _quantityButton(Icons.add_rounded, () {
                          ref.read(ticketQuantityProvider.notifier).state = ticketQuantity + 1;
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          child: Container(
            decoration: BoxDecoration(boxShadow: [BoxShadow(color: AppColors.actionGreen.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))]),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.actionGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 0,
              ),
              child: const Text('Comprar ahora', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: AppColors.actionGreen, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Precio del ticket: ', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
          SizedBox(width: 4),
          Icon(Icons.flash_on, color: Colors.white, size: 14),
          SizedBox(width: 2),
          Text('20', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildMyTicketsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: CustomPaint(
        painter: PointyBorderPainter(color: AppColors.actionGreen),
        child: ClipPath(
          clipper: PointyClipper(),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 60),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                const Text('¡Buena Suerte!', style: TextStyle(color: Color(0xFF0056B3), fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Los resultados se publicarán en la página\nde Facebook de Agro Fertilizante', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Colors.black87, height: 1.3)),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppColors.actionGreen, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Text('¡AÚN NO TIENES TICKETS?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(height: 4),
                      const Text('Conéctate diario GRATIS:', style: TextStyle(color: Colors.white, fontSize: 11)),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _bulletItem('Gana monedas extra'),
                          _bulletItem('Compra más tickets'),
                          _bulletItem('Multiplica chances'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2, left: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.circle, size: 4, color: Colors.black),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.actionGreen),
        padding: const EdgeInsets.all(5),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildSpecialOffersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.symmetric(horizontal: 25), child: Text('Ofertas especiales', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900))),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _offerCard('10', '7 días'),
            _offerCard('20', '2 semanas'),
            _offerCard('50', '4 semanas'),
          ],
        ),
      ],
    );
  }

  Widget _offerCard(String amount, String period) {
    return Container(
      width: 90, padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        children: [
          const Icon(Icons.flash_on, color: Colors.orange, size: 28),
          Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.actionGreen)),
          Text('Conéctate\n$period', textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, color: Colors.grey, height: 1.1)),
        ],
      ),
    );
  }

  Widget _buildRaffleTicketCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.school_rounded, size: 18, color: Colors.black87),
              SizedBox(width: 8),
              Text('GRAN SORTEO', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 12),
          // Simulación del ticket verde
          Container(
            height: 130, width: double.infinity,
            decoration: BoxDecoration(color: AppColors.actionGreen.withOpacity(0.05), borderRadius: BorderRadius.circular(10)),
            child: const Center(child: Icon(Icons.confirmation_number, size: 40, color: AppColors.actionGreen)),
          ),
        ],
      ),
    );
  }
}

// --- CLASES TÉCNICAS (REFINADAS) ---

class RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double cut = 15.0; 
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - cut, size.height / 2); // Punta derecha hacia adentro
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(cut, size.height / 2); // Punta izquierda hacia adentro
    path.close();
    return path;
  }
  @override bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.1)..style = PaintingStyle.stroke..strokeWidth = 0.5;
    double spacing = 18.0;
    for (double i = -size.width; i < size.width + size.height; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i + size.height, size.height), paint);
      canvas.drawLine(Offset(i, size.height), Offset(i + size.height, 0), paint);
    }
  }
  @override bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PointyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double p = 30.0;
    path.lineTo(0, size.height - p);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - p);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PointyBorderPainter extends CustomPainter {
  final Color color;
  PointyBorderPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..style = PaintingStyle.stroke..strokeWidth = 1.0;
    double p = 30.0;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - p);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - p);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}