import 'package:flutter/material.dart';
import '../theme.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBlue,
      appBar: AppBar(title: const Text('Aula Lid-IA · Profesor')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido, profesor',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkNavy,
              ),
            ),
            const SizedBox(height: 24),

            _AccionCard(
              icono: Icons.video_call,
              titulo: 'Conectarse en vivo',
              descripcion: 'Inicia una clase en vivo con tus alumnos.',
              color: AppTheme.primaryGreen,
              onTap: () {
                // Aquí luego integramos la videollamada
              },
            ),
            const SizedBox(height: 16),

            _AccionCard(
              icono: Icons.upload_file,
              titulo: 'Subir clase o actividad',
              descripcion:
                  'Sube videos o materiales grabados para tus alumnos.',
              color: AppTheme.darkNavy,
              onTap: () {
                // Aquí luego integramos la subida de archivos
              },
            ),
            const SizedBox(height: 16),

            _AccionCard(
              icono: Icons.groups,
              titulo: 'Mis alumnos',
              descripcion: 'Consulta el progreso de tus estudiantes.',
              color: AppTheme.accentGold,
              onTap: () {
                // Aquí luego mostramos la lista de alumnos
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AccionCard extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String descripcion;
  final Color color;
  final VoidCallback onTap;

  const _AccionCard({
    required this.icono,
    required this.titulo,
    required this.descripcion,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icono, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppTheme.darkNavy,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      descripcion,
                      style: TextStyle(color: Colors.grey[700], fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
