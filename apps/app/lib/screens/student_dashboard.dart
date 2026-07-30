import 'package:flutter/material.dart';
import '../theme.dart';

class Modulo {
  final String nombre;
  final IconData icono;
  final Color color;

  const Modulo(this.nombre, this.icono, this.color);
}

const List<Modulo> modulos = [
  Modulo('Español', Icons.menu_book, Color(0xFFE6C568)),
  Modulo('Inglés', Icons.language, Color(0xFF9FC5E8)),
  Modulo('Matemáticas', Icons.calculate, Color(0xFFEA9999)),
  Modulo('Ciencias Sociales', Icons.public, Color(0xFFB4A7D6)),
  Modulo('Ciencias Naturales', Icons.eco, Color(0xFFB6D7A8)),
  Modulo('Cátedra de Paz', Icons.diversity_3, Color(0xFFD9D2E9)),
  Modulo('Religión', Icons.menu_book_outlined, Color(0xFFDCC6A0)),
  Modulo('Informática', Icons.computer, Color(0xFFA4C2F4)),
  Modulo('TelePsicología', Icons.headset_mic, Color(0xFFF4CCCC)),
];

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBlue,
      appBar: AppBar(title: const Text('Aula Lid-IA · Alumno')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: modulos.length,
          itemBuilder: (context, index) {
            final modulo = modulos[index];
            return _ModuloCard(modulo: modulo);
          },
        ),
      ),
    );
  }
}

class _ModuloCard extends StatelessWidget {
  final Modulo modulo;
  const _ModuloCard({required this.modulo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: modulo.color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Aquí luego navegamos al contenido del módulo
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(modulo.icono, size: 40, color: AppTheme.darkNavy),
              const SizedBox(height: 12),
              Text(
                modulo.nombre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkNavy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
