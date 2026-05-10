import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _msgController = TextEditingController();
  final _messages = <Map<String, String>>[
    {'sender': 'bot', 'text': 'Bienvenido al centro de apoyo legal. Estamos aquí para ayudarle. ¿En qué podemos asistirle hoy?', 'time': '10:00'},
  ];
  final _responses = [
    'Entiendo su situación. Le recomiendo guardar todas las evidencias digitales (capturas, URLs) antes de continuar.',
    'Gracias por compartir. Nuestro equipo legal evaluará su caso. Mientras tanto, evite interactuar con el agresor.',
    'Lamento mucho su situación. ¿Ha denunciado ante las autoridades? Podemos guiarle en el proceso.',
    'La ley peruana protege a víctimas de ciberacoso. Podemos asesorarle sobre los pasos legales a seguir.',
    'Su seguridad es prioritaria. Si siente peligro inminente, contacte a la línea de emergencia 105.',
  ];

  @override
  void dispose() {
    _msgController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _msgController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add({'sender': 'user', 'text': text, 'time': DateTime.now().toString().substring(11, 16)});
      _msgController.clear();
    });
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      setState(() {
        _messages.add({
          'sender': 'bot',
          'text': _responses[DateTime.now().millisecond % _responses.length],
          'time': DateTime.now().toString().substring(11, 16),
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20)],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF00113A),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Row(children: [
                    Container(width: 12, height: 12,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF4CAF50)),
                    ),
                    const SizedBox(width: 12),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Consejero Legal ZSEJC', style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text('En línea · Respuesta inmediata', style: GoogleFonts.inter(fontSize: 12, color: Color(0xFF94A3B8))),
                    ]),
                  ]),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (_, i) {
                      final m = _messages[i];
                      final isUser = m['sender'] == 'user';
                      return Align(
                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: isUser ? const Color(0xFF00113A) : const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                              bottomLeft: isUser ? const Radius.circular(16) : const Radius.circular(4),
                              bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(16),
                            ),
                          ),
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                            Text(m['text']!, style: TextStyle(fontSize: 14, color: isUser ? Colors.white : const Color(0xFF191C1E))),
                            const SizedBox(height: 4),
                            Text(m['time']!, style: TextStyle(fontSize: 9, color: isUser ? Colors.white70 : const Color(0xFF444650))),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFFE2E8F0)))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _msgController,
                          decoration: InputDecoration(
                            hintText: 'Escriba su mensaje aquí...',
                            hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                            filled: true,
                            fillColor: const Color(0xFFF7F9FB),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          onSubmitted: (_) => _sendMessage(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 44, height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(colors: [Color(0xFF00113A), Color(0xFF5700C9)]),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white, size: 18),
                          onPressed: _sendMessage,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      decoration: const BoxDecoration(color: Color(0xFF00113A)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Chat de Apoyo', style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 8),
        Text('Espacio seguro y confidencial.', style: GoogleFonts.inter(fontSize: 16, color: Color(0xFFCBD5E1))),
      ]),
    );
  }
}
