import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/servicios_screen.dart';
import 'screens/denuncias_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/recursos_screen.dart';
import 'screens/staff_screen.dart';
import 'screens/app_download_screen.dart';

void main() {
  runApp(const JusticiaDigitalApp());
}

class JusticiaDigitalApp extends StatelessWidget {
  const JusticiaDigitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legal Tech ZSEJC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00113A),
          primary: const Color(0xFF00113A),
          onPrimary: Colors.white,
          secondary: const Color(0xFF006A62),
          tertiary: const Color(0xFF5700C9),
          surface: const Color(0xFFF7F9FB),
          onSurface: const Color(0xFF191C1E),
          onSurfaceVariant: const Color(0xFF444650),
          outline: const Color(0xFF757682),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FB),
        textTheme: GoogleFonts.interTextTheme().copyWith(
          headlineLarge: GoogleFonts.manrope(
            fontSize: 40, fontWeight: FontWeight.w800, letterSpacing: -0.02, color: const Color(0xFF00113A),
          ),
          headlineMedium: GoogleFonts.manrope(
            fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.01, color: const Color(0xFF00113A),
          ),
          headlineSmall: GoogleFonts.manrope(
            fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF00113A),
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 18, fontWeight: FontWeight.w400, color: const Color(0xFF444650),
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xFF191C1E),
          ),
          labelLarge: GoogleFonts.inter(
            fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.05,
          ),
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    ServiciosScreen(),
    DenunciasScreen(),
    ChatScreen(),
    RecursosScreen(),
  ];

  void _openDrawerScreen(int index) {
    Navigator.pop(context);
    setState(() {
      switch (index) {
        case 5: _currentIndex = 5;
        case 6: _currentIndex = 6;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex < 5
          ? _screens[_currentIndex]
          : _currentIndex == 5
              ? const StaffScreen()
              : const AppDownloadScreen(),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(child: Text('Z', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                  ),
                  const SizedBox(height: 12),
                  const Text('Legal Tech ZSEJC', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text('Justicia Digital', style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 13)),
                ]),
              ),
              _drawerItem(Icons.home, 'Inicio', 0),
              _drawerItem(Icons.gavel, 'Servicios', 1),
              _drawerItem(Icons.report, 'Denuncias', 2),
              _drawerItem(Icons.chat, 'Chat', 3),
              _drawerItem(Icons.menu_book, 'Recursos', 4),
              const Divider(),
              _drawerItem(Icons.badge, 'Staff Abogados', 5),
              _drawerItem(Icons.download, 'Descargar App', 6),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex < 5 ? _currentIndex : 0,
          onTap: (i) => setState(() => _currentIndex = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF5700C9),
          unselectedItemColor: const Color(0xFF444650),
          selectedLabelStyle: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.inter(fontSize: 11),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.gavel_outlined), activeIcon: Icon(Icons.gavel), label: 'Servicios'),
            BottomNavigationBarItem(icon: Icon(Icons.report_outlined), activeIcon: Icon(Icons.report), label: 'Denuncias'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), activeIcon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), activeIcon: Icon(Icons.menu_book), label: 'Recursos'),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String label, int index) {
    return ListTile(
      leading: Icon(icon, color: index == _currentIndex ? const Color(0xFF5700C9) : const Color(0xFF444650)),
      title: Text(label, style: TextStyle(
        fontSize: 14,
        fontWeight: index == _currentIndex ? FontWeight.w600 : FontWeight.w400,
        color: index == _currentIndex ? const Color(0xFF5700C9) : const Color(0xFF00113A),
      )),
      onTap: () => _openDrawerScreen(index),
    );
  }
}
