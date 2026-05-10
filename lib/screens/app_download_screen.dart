import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDownloadScreen extends StatelessWidget {
  const AppDownloadScreen({super.key});

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
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(48),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFF1F5F9)),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 20)],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 96, height: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]),
                        ),
                        child: const Icon(Icons.phone_android, color: Colors.white, size: 48),
                      ),
                      const SizedBox(height: 24),
                      Text('App Justicia Digital', style: GoogleFonts.manrope(fontSize: 26, fontWeight: FontWeight.w700, color: const Color(0xFF00113A))),
                      const SizedBox(height: 12),
                      Text('Accede a todos los servicios desde tu dispositivo móvil: denuncias, chat de apoyo, recursos educativos y más.',
                        textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF444650), height: 1.5)),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color(0xFF00113A),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Descarga la APK desde la página web: https://geniohd-beep.github.io/justicia_digital/'),
                                backgroundColor: Color(0xFF006A62),
                              ),
                            );
                          },
                          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Icon(Icons.download, color: Colors.white, size: 20),
                            SizedBox(width: 8),
                            Text('Descargar APK (Android)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          ]),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('Versión 1.0 · Requiere Android 5.0+', style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF444650))),
                    ],
                  ),
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
        Text('Descargar App', style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 8),
        Text('Lleva Justicia Digital contigo.', style: GoogleFonts.inter(fontSize: 16, color: Color(0xFFCBD5E1))),
      ]),
    );
  }
}
