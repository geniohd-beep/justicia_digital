import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  final _abogados = const [
    {'nombre': 'Zulma Santos Ventura', 'rol': 'Scrum Master', 'iniciales': 'ZS', 'color': Color(0xFF5700C9), 'email': 'zusantosve@ucvvirtual.edu.pe', 'desc': 'Especialista en derecho digital y gestión de proyectos legales tecnológicos.'},
    {'nombre': 'Sixto Irribarren Cruz', 'rol': 'Abogado Litigante', 'iniciales': 'SI', 'color': Color(0xFF006A62), 'email': 'siirribarrencr@ucvvirtual.edu.pe', 'desc': 'Especialista en defensa legal contra el ciberacoso y delitos informáticos.'},
    {'nombre': 'Emilio Robles Soldevilla', 'rol': 'Abogado Corporativo', 'iniciales': 'ER', 'color': Color(0xFF5700C9), 'email': 'emroblesso@ucvvirtual.edu.pe', 'desc': 'Especialista en derecho corporativo y protección de datos personales.'},
    {'nombre': 'Carlos Jefferson Bardales Torres', 'rol': 'Abogado Penalista', 'iniciales': 'CB', 'color': Color(0xFF006A62), 'email': 'cabardalesto@ucvvirtual.edu.pe', 'desc': 'Especialista en derecho penal y delitos informáticos.'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Container(width: 48, height: 4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    gradient: LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Staff de Abogados', style: GoogleFonts.manrope(fontSize: 26, fontWeight: FontWeight.w700, color: const Color(0xFF00113A))),
                const SizedBox(height: 8),
                Text('Conozca a nuestro equipo de profesionales en derecho digital.',
                  style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF444650))),
                const SizedBox(height: 24),
                ..._abogados.map((a) => Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFF1F5F9)),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12)],
                  ),
                  child: Column(children: [
                    Container(
                      width: 72, height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: (a['color'] as Color) == const Color(0xFF5700C9)
                            ? const LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)])
                            : LinearGradient(colors: [a['color'] as Color, a['color'] as Color]),
                      ),
                      child: Center(child: Text(a['iniciales'] as String, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
                    ),
                    const SizedBox(height: 16),
                    Text(a['nombre'] as String, style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.w600, color: const Color(0xFF00113A))),
                    const SizedBox(height: 4),
                    Text(a['rol'] as String, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1, color: a['color'] as Color)),
                    const SizedBox(height: 12),
                    Text(a['desc'] as String, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF444650))),
                    if (a['email'] != null) ...[
                      const SizedBox(height: 8),
                      Text(a['email'] as String, style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.bold, color: const Color(0xFF00113A))),
                    ],
                  ]),
                )),
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
        Text('Staff Legal', style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 8),
        Text('Nuestro equipo de profesionales.', style: GoogleFonts.inter(fontSize: 16, color: Color(0xFFCBD5E1))),
      ]),
    );
  }
}
