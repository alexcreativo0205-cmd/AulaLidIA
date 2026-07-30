import 'package:flutter/material.dart';
import '../theme.dart';
import 'student_dashboard.dart';
import 'teacher_dashboard.dart';

enum UserRole { alumno, profesor }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserRole _selectedRole = UserRole.alumno;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBlue,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.school,
                  size: 60,
                  color: AppTheme.primaryGreen,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Aula Lid-IA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkNavy,
                  ),
                ),
                const Text(
                  'Aprender sin distancia',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: AppTheme.primaryGreen,
                  ),
                ),
                const SizedBox(height: 32),

                // Selector de rol
                ToggleButtons(
                  isSelected: [
                    _selectedRole == UserRole.alumno,
                    _selectedRole == UserRole.profesor,
                  ],
                  onPressed: (index) {
                    setState(() {
                      _selectedRole = index == 0
                          ? UserRole.alumno
                          : UserRole.profesor;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  selectedColor: Colors.white,
                  fillColor: AppTheme.primaryGreen,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text('Alumno'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text('Profesor'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aquí luego conectamos con el backend (apps/api)
                      if (_selectedRole == UserRole.alumno) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentDashboard(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeacherDashboard(),
                          ),
                        );
                      }
                    },
                    child: const Text('Iniciar sesión'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
