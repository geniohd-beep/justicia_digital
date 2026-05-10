import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopNav(context),
          _buildHero(context),
          _buildServicios(context),
          _buildCTA(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildTopNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        border: const Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 32, height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00113A), Color(0xFF5700C9)],
                  ),
                ),
                child: const Center(child: Text('Z', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
              ),
              const SizedBox(width: 8),
              Text('Legal Tech ZSEJC',
                style: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.w800, color: const Color(0xFF00113A))),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00113A), Color(0xFF5700C9)],
                  ),
                  boxShadow: [BoxShadow(color: const Color(0xFF5700C9).withValues(alpha: 0.2), blurRadius: 12)],
                ),
                child: const Text('Reportar Caso', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF5700C9).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF5700C9).withValues(alpha: 0.2)),
            ),
            child: const Text('DERECHO DIGITAL · VANGUARDIA PERUANA',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Color(0xFF5700C9))),
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              text: 'Protección Legal Integral ante el ',
              style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.02, color: const Color(0xFF00113A)),
              children: [
                TextSpan(text: 'Ciberacoso', style: TextStyle(color: const Color(0xFF5700C9))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Especialistas en defensa jurídica y técnica de alto nivel para víctimas de hostigamiento digital, difamación y violencia en red.',
            style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF444650), height: 1.5)),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildButton('Solicitar Asesoría', true, () {}),
              const SizedBox(width: 12),
              _buildButton('Ver Servicios', false, () {}),
            ],
          ),
          const SizedBox(height: 32),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDCA6GsSVo9-DDcSdiY7oP30WnBMk7vWdOuLE-DFw1kl0-7E0ZQRZ6AGRc8eX9x6zaPN4Yca6C4MwDsde-LQjPKtw-MeSIAdfrlh5We5-bhkLsdwCnXzFXnZLJn0-nMQ5hp6uUSmd1ZUVYQ7nQjmwwgNq5yfT6jhspG4tuRa-at_2x-bGNASUTBCgIANzN8OWiKQtjCqSlJGkOIbAtZqy63tYie0TBL3WyM2_v6-YinlGjztC0y00tW1R7xI6vIOrSQWcxP2hC43gU'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 36, height: 36,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF006A62)),
                        child: const Icon(Icons.shield, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 12),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        const Text('Seguridad Garantizada', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF00113A))),
                        Text('Protocolos de encriptación legal avanzada', style: TextStyle(fontSize: 9, color: const Color(0xFF444650))),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, bool filled, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: filled ? const LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]) : null,
          border: filled ? null : Border.all(color: const Color(0xFF006A62), width: 2),
          boxShadow: filled ? [BoxShadow(color: const Color(0xFF5700C9).withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 4))] : null,
        ),
        child: Text(text, style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600,
          color: filled ? Colors.white : const Color(0xFF006A62),
        )),
      ),
    );
  }

  Widget _buildServicios(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          Container(width: 48, height: 4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              gradient: LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]),
            ),
          ),
          const SizedBox(height: 16),
          Text('Servicios Especializados',
            style: GoogleFonts.manrope(fontSize: 26, fontWeight: FontWeight.w700, color: const Color(0xFF00113A))),
          const SizedBox(height: 8),
          Text('Soluciones legales y técnicas directas con enfoque en la recuperación de su tranquilidad digital.',
            textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF444650))),
          const SizedBox(height: 32),
          _buildServiceCard(
            icon: Icons.verified_user,
            iconColor: const Color(0xFF006A62),
            title: 'Evidencia Digital',
            desc: 'Certificación técnica de pruebas digitales con validez jurídica inquebrantable ante tribunales.',
            borderColor: const Color(0xFF006A62),
          ),
          const SizedBox(height: 16),
          _buildServiceCardHighlighted(
            icon: Icons.gavel,
            title: 'Defensa Legal',
            desc: 'Representación de alto impacto en delitos informáticos, acoso y difamación agravada.',
          ),
          const SizedBox(height: 16),
          _buildServiceCard(
            icon: Icons.psychology,
            iconColor: const Color(0xFF5700C9),
            title: 'Soporte Estratégico',
            desc: 'Asesoría integral 360° para la gestión de crisis reputacional y recuperación de identidad online.',
            borderColor: const Color(0xFF5700C9),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({required IconData icon, required Color iconColor, required String title, required String desc, required Color borderColor}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FB).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: iconColor, size: 28),
        ),
        const SizedBox(height: 16),
        Text(title, style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF00113A))),
        const SizedBox(height: 8),
        Text(desc, style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF444650), height: 1.5)),
      ]),
    );
  }

  Widget _buildServiceCardHighlighted({required IconData icon, required String title, required String desc}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]),
        boxShadow: [BoxShadow(color: const Color(0xFF5700C9).withValues(alpha: 0.2), blurRadius: 24)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.gavel, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 16),
        Text(title, style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
        const SizedBox(height: 8),
        Text(desc, style: GoogleFonts.inter(fontSize: 13, color: Colors.white.withValues(alpha: 0.8), height: 1.5)),
        const SizedBox(height: 16),
        Row(children: [
          Text('SABER MÁS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF57FAE9))),
          const SizedBox(width: 4),
          Icon(Icons.arrow_forward, size: 14, color: const Color(0xFF57FAE9)),
        ]),
      ]),
    );
  }

  Widget _buildCTA(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      decoration: const BoxDecoration(color: Color(0xFF00113A)),
      child: Column(
        children: [
          Text('¿Necesita asistencia inmediata?',
            style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 16),
          Text('Proteja su integridad hoy mismo. Ofrecemos consultas confidenciales con una respuesta legal de alta prioridad.',
            textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFFCBD5E1))),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF57FAE9),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: const Color(0xFF006A62).withValues(alpha: 0.2), blurRadius: 20)],
            ),
            child: const Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.call, color: Color(0xFF00113A), size: 20),
              SizedBox(width: 8),
              Text('Contactar un Abogado', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF00113A))),
            ]),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: const Text('Agendar Cita Online', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width: 24, height: 1, color: Colors.white.withValues(alpha: 0.2)),
            const SizedBox(width: 12),
            Text('ATENCIÓN 24/7 · MÁXIMA CONFIDENCIALIDAD',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 3, color: const Color(0xFF94A3B8))),
            const SizedBox(width: 12),
            Container(width: 24, height: 1, color: Colors.white.withValues(alpha: 0.2)),
          ]),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(width: 20, height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: const LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]),
                ),
                child: const Center(child: Text('Z', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold))),
              ),
              const SizedBox(width: 6),
              Text('Legal Tech ZSEJC', style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w800, color: const Color(0xFF00113A))),
            ],
          ),
          const SizedBox(height: 8),
          Align(alignment: Alignment.centerLeft,
            child: Text('© 2024. Líderes en Justicia y Protección Digital en el Perú.',
              style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF444650))),
          ),
          const SizedBox(height: 24),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              _buildSocialIcon(Icons.facebook, const Color(0xFF00113A), const Color(0xFF1877F2)),
              const SizedBox(width: 8),
              _buildSocialIcon(Icons.photo_camera, const Color(0xFF00113A), const Color(0xFFE4405F)),
              const SizedBox(width: 8),
              _buildSocialIcon(Icons.play_circle, const Color(0xFF00113A), const Color(0xFFFF0000)),
              const SizedBox(width: 8),
              _buildSocialIcon(Icons.music_note, const Color(0xFF00113A), const Color(0xFF000000)),
            ]),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F9FB),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF1F5F9)),
              ),
              child: Row(children: [
                Icon(Icons.workspace_premium, size: 14, color: const Color(0xFF5700C9)),
                const SizedBox(width: 4),
                Text.rich(TextSpan(
                  text: 'Scrum Master: ',
                  style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500, color: const Color(0xFF444650)),
                  children: [TextSpan(
                    text: 'zusantosve@ucvvirtual.edu.pe',
                    style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF00113A)),
                  )],
                )),
              ]),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color defaultColor, Color hoverColor) {
    return Container(
      width: 32, height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, size: 18, color: defaultColor),
    );
  }
}
