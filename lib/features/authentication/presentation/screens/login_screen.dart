import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(37, 197, 115, 1.0),
      body: Center(
        child: Text(
          "Login Screen",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
