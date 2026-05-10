import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DenunciasScreen extends StatefulWidget {
  const DenunciasScreen({super.key});

  @override
  State<DenunciasScreen> createState() => _DenunciasScreenState();
}

class _DenunciasScreenState extends State<DenunciasScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descController = TextEditingController();
  String? _tipoAcoso;
  String? _plataforma;

  final _denuncias = <Map<String, String>>[];

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

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
                if (_denuncias.isNotEmpty) ...[
                  Text('Mis Denuncias', style: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF00113A))),
                  const SizedBox(height: 16),
                  ..._denuncias.map((d) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: const Border(left: BorderSide(color: Color(0xFFFF5722), width: 4)),
                      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8)],
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text('#${d['id']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF00113A))),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: const Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(12)),
                          child: const Text('Pendiente', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFFE65100))),
                        ),
                      ]),
                      const SizedBox(height: 6),
                      Text(d['tipo']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF00113A))),
                      const SizedBox(height: 4),
                      Text(d['desc']!, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF444650))),
                    ]),
                  )),
                  const Divider(height: 32),
                ],
                Text('Nueva Denuncia', style: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.w600, color: const Color(0xFF00113A))),
                const SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        initialValue: _tipoAcoso,
                        decoration: _inputDecoration('Tipo de acoso'),
                        items: ['Ciberacoso escolar', 'Acoso en redes sociales', 'Suplantación de identidad', 'Difusión no consentida', 'Amenazas en línea', 'Otro']
                            .map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(fontSize: 14)))).toList(),
                        onChanged: (v) => _tipoAcoso = v,
                        validator: (v) => v == null ? 'Seleccione un tipo' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _descController,
                        maxLines: 4,
                        decoration: _inputDecoration('Descripción detallada'),
                        validator: (v) => (v == null || v.isEmpty) ? 'Describa la situación' : null,
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        initialValue: _plataforma,
                        decoration: _inputDecoration('Plataforma'),
                        items: ['WhatsApp', 'Instagram', 'Facebook', 'TikTok', 'Twitter/X', 'Telegram', 'Otra']
                            .map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(fontSize: 14)))).toList(),
                        onChanged: (v) => _plataforma = v,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            backgroundColor: const Color(0xFF00113A),
                          ),
                          onPressed: _submitDenuncia,
                          child: const Text('Enviar Denuncia', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                      ),
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

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 13, color: Color(0xFF444650)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF5700C9))),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  void _submitDenuncia() {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _denuncias.insert(0, {
        'id': DateTime.now().millisecondsSinceEpoch.toString().substring(7),
        'tipo': _tipoAcoso ?? '',
        'desc': _descController.text,
        'plataforma': _plataforma ?? '',
      });
    });
    _tipoAcoso = null;
    _plataforma = null;
    _descController.clear();
    _formKey.currentState?.reset();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Denuncia registrada exitosamente'), backgroundColor: Color(0xFF006A62)),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      decoration: const BoxDecoration(color: Color(0xFF00113A)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Reportar Caso', style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 8),
        Text('Presente su denuncia de forma segura y confidencial.', style: GoogleFonts.inter(fontSize: 16, color: Color(0xFFCBD5E1))),
      ]),
    );
  }
}
