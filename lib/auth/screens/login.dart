import 'dart:developer';
import 'package:bloc_course/auth/bloc/auth_bloc.dart';
import 'package:bloc_course/auth/screens/signup.dart';
import 'package:bloc_course/auth/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  late AuthBloc _authBloc;
  @override
  void initState() {
    _authBloc = AuthBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("login top build");
    return BlocProvider(
      create: (_) => _authBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) =>
                      current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                      controller: _email,
                      focusNode: emailFocus,
                      onChanged: (value) {
                        context.read<AuthBloc>().add(EmailChnage(email: value));
                      },
                      onFieldSubmitted: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) =>
                      current.password != previous.password,
                  builder: (context, state) {
                    return TextFormField(
                      controller: _password,
                      focusNode: passwordFocus,
                      onChanged: (value) {
                        context
                            .read<AuthBloc>()
                            .add(PasswordChange(password: value));
                      },
                      onFieldSubmitted: (value) {},
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.authStatus == AuthStatus.failed) {
                      log("Login Failed ==>> ${state.msg}");
                    }
                    // if (state.authStatus == AuthStatus.loading) {
                    //   log("Loading ..... ..... .....");
                    // }
                    if (state.authStatus == AuthStatus.success) {
                      log("Success ==>> ${state.msg}");
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(LoginEvent());
                        },
                        child: const Text("Login"),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: const Text("Create new account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
