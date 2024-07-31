import 'dart:developer';
import 'package:bloc_course/auth/screens/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    log("sign up top build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _email,
                focusNode: emailFocus,
                onChanged: (value) {},
                onFieldSubmitted: (value) {},
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _password,
                focusNode: passwordFocus,
                onChanged: (value) {},
                onFieldSubmitted: (value) {},
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Sign Up"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Text("Back to login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
