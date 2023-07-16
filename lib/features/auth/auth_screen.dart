import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_cupertino/core/APIs/authorize.dart';
import 'package:test_cupertino/main_screen.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        automaticallyImplyLeading: false,
        middle: Text('Авторизация'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoTextField(
            controller: emailController,
            placeholder: 'Логин или почта',
            decoration: const BoxDecoration(
              color: CupertinoColors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
          ),

          Container(
            height: 1,
            color: const Color(0xFFE0E6ED),
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),

          CupertinoTextField(
            controller: passwordController,
            placeholder: 'Пароль',
            decoration: const BoxDecoration(
              color: CupertinoColors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
          ),

          const SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoButton(
              color: const Color(0xFF4631D2),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Войти',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                authorize(emailController.text, passwordController.text).then((value) {
                  print(value.body);
                  if(value.statusCode == 200){
                    var some = json.decode(utf8.decode(value.bodyBytes));
                    print(some["user"]["email"]);
                    print(some["user"]["nickname"]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreen(email: some["user"]["email"], nickname: some["user"]["nickname"],)));
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 19),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CupertinoButton(
              color: const Color(0xFF4631D2),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Зарегистрироваться',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}