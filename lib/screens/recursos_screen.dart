import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecursosScreen extends StatelessWidget {
  const RecursosScreen({super.key});

  final _recursos = const [
    {'icon': Icons.search, 'title': 'Guía para identificar el ciberacoso', 'desc': 'Aprenda a reconocer las señales de alerta del acoso en línea.', 'color': Color(0xFF006A62)},
    {'icon': Icons.verified_user, 'title': 'Cómo proteger su privacidad online', 'desc': 'Configuración de privacidad paso a paso en redes sociales.', 'color': Color(0xFF5700C9)},
    {'icon': Icons.book, 'title': 'Derechos digitales: lo que dice la ley', 'desc': 'Conozca sus derechos en el entorno digital y las leyes peruanas.', 'color': Color(0xFF006A62)},
    {'icon': Icons.assignment, 'title': 'Pasos a seguir si es víctima', 'desc': 'Guía práctica: desde guardar evidencias hasta buscar ayuda.', 'color': Color(0xFF5700C9)},
    {'icon': Icons.psychology, 'title': 'Salud mental y bienestar digital', 'desc': 'Consejos para cuidar su salud mental en el entorno digital.', 'color': Color(0xFF006A62)},
    {'icon': Icons.people, 'title': 'Cómo apoyar a alguien que sufre', 'desc': 'Si conoce a alguien en esta situación, aquí cómo ayudar.', 'color': Color(0xFF5700C9)},
    {'icon': Icons.shield, 'title': 'Ciberseguridad para jóvenes', 'desc': 'Consejos prácticos para navegar seguro en internet.', 'color': Color(0xFF006A62)},
    {'icon': Icons.phone, 'title': 'Líneas de ayuda y contacto', 'desc': 'Directorio de líneas de ayuda, orientación legal y apoyo.', 'color': Color(0xFF5700C9)},
    {'icon': Icons.favorite, 'title': 'Testimonios de superación', 'desc': 'Historias reales de personas que superaron el ciberacoso.', 'color': Color(0xFF006A62)},
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
                Text('Recursos Educativos', style: GoogleFonts.manrope(fontSize: 26, fontWeight: FontWeight.w700, color: const Color(0xFF00113A))),
                const SizedBox(height: 8),
                Text('Guías, artículos y herramientas para prevenir y actuar contra el ciberacoso.',
                  style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF444650))),
                const SizedBox(height: 24),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 3.2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _recursos.length,
                  itemBuilder: (_, i) {
                    final r = _recursos[i];
                    final color = r['color'] as Color;
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFF1F5F9)),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 12)],
                      ),
                      child: Row(children: [
                        Container(
                          width: 48, height: 48,
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(r['icon'] as IconData, color: color, size: 24),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(r['title'] as String, style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.w600, color: const Color(0xFF00113A))),
                              const SizedBox(height: 4),
                              Text(r['desc'] as String, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF444650))),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 14, color: const Color(0xFF5700C9)),
                      ]),
                    );
                  },
                ),
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
        Text('Recursos', style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 8),
        Text('Educación y prevención contra el ciberacoso.', style: GoogleFonts.inter(fontSize: 16, color: Color(0xFFCBD5E1))),
      ]),
    );
  }
}
