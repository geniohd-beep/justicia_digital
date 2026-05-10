import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Container(width: 48, height: 4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    gradient: LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Nuestros Servicios', style: GoogleFonts.manrope(fontSize: 26, fontWeight: FontWeight.w700, color: const Color(0xFF00113A))),
                const SizedBox(height: 8),
                Text('Soluciones completas para la protección de sus derechos digitales.',
                  textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF444650))),
                const SizedBox(height: 32),
                _buildServicio(Icons.gavel, 'Defensa Legal Especializada', 'Representación en procesos penales por delitos informáticos, difamación, amenazas y violación de la privacidad.', const Color(0xFF006A62)),
                const SizedBox(height: 16),
                _buildServicio(Icons.verified_user, 'Certificación de Evidencias', 'Preservación y certificación técnica de pruebas digitales con cadena de custodia y validez jurídica.', const Color(0xFF5700C9)),
                const SizedBox(height: 16),
                _buildServicio(Icons.shield, 'Protección de Identidad', 'Asistencia en suplantación de identidad, robo de datos personales y limpieza de reputación online.', const Color(0xFF006A62)),
                const SizedBox(height: 16),
                _buildServicio(Icons.forum, 'Acompañamiento Legal', 'Asesoría paso a paso durante todo el proceso legal, desde la denuncia hasta la resolución del caso.', const Color(0xFF5700C9)),
                const SizedBox(height: 16),
                _buildServicio(Icons.security, 'Ciberseguridad Legal', 'Evaluación de riesgos digitales, auditoría de seguridad y recomendaciones para protección online.', const Color(0xFF006A62)),
                const SizedBox(height: 16),
                _buildServicio(Icons.psychology, 'Apoyo Psicológico', 'Contención emocional y derivación a profesionales de salud mental especializados en víctimas de violencia digital.', const Color(0xFF5700C9)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      decoration: const BoxDecoration(color: Color(0xFF00113A)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Servicios', style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 8),
        Text('Protección legal especializada', style: GoogleFonts.inter(fontSize: 16, color: Color(0xFFCBD5E1))),
      ]),
    );
  }

  Widget _buildServicio(IconData icon, String title, String desc, Color iconColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: iconColor, size: 32),
        const SizedBox(height: 12),
        Text(title, style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF00113A))),
        const SizedBox(height: 8),
        Text(desc, style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF444650), height: 1.5)),
      ]),
    );
  }
}
