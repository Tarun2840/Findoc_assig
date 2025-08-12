import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final LoginStatus status;
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;

  const LoginState({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
    );
  }

  bool get isValid => emailError == null && passwordError == null && 
                      email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object?> get props => [status, email, password, emailError, passwordError];
}