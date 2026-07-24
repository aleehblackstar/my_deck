import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final AuthController controller = Get.put(AuthController());

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> _handleRegister() async {
    if (!formKey.currentState!.validate()) return;

    final success = await controller.register(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    if (success) {
      Get.back();
      Get.snackbar('Sucesso', 'Conta criada! Faça login para continuar.');
    } else {
      Get.snackbar('Erro', controller.errorMessage.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Faça o cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('E-mail'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'E-mail obrigatório';
                  }
                  if (!value.contains('@')) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Senha'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Senha obrigatória';
                  }
                  if (value.length < 6) {
                    return 'A senha precisa ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Confirmar senha'),
                ),
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Obx(
                () => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _handleRegister,
                        child: const Text('Criar conta'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}