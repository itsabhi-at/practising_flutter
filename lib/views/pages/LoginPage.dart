// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practising_flutter/controller/loginController.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController loginController = Get.put(LoginController());
  final _textController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text('Hello world!'),
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(hintText: 'enter email'),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'enter password'),
              ),
              ElevatedButton(
                  onPressed: () {
                    loginController.loginWithEmail(
                        _textController.text.toString(),
                        _passwordController.text.toString());
                  },
                  child: Obx(() => loginController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : const Center(child: Text('click'))))
            ],
          ),
        ),
      )),
    );
  }
}
