import 'dart:developer';
import 'package:bloc_course/auth/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:bloc_course/auth/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<EmailChnage>(_emailChnage);
    on<PasswordChange>(_passwordChnage);
    on<LoginEvent>(_login);
  }
  void _emailChnage(EmailChnage event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(email: event.email),
    );
  }

  void _passwordChnage(PasswordChange event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(password: event.password),
    );
  }

  void _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    Map data = {"email": state.email, "password": state.password};
    try {
      final response = await http.post(
        Uri.parse(loginURL),
        body: data,
      );
      if (response.statusCode == 200) {
        state.copyWith(authStatus: AuthStatus.success, msg: "Login Success");
        log("Success");
      } else {
        state.copyWith(
            authStatus: AuthStatus.failed,
            msg: "Something wents wrong ${response.statusCode}");
        log(response.statusCode.toString());
      }
    } catch (e) {
      state.copyWith(msg: e.toString());
      log(e.toString());
    }
  }
}
