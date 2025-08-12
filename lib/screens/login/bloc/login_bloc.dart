import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../../utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final emailError = Validators.validateEmail(event.email);
    emit(state.copyWith(
      email: event.email,
      emailError: emailError,
      status: LoginStatus.initial,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final passwordError = Validators.validatePassword(event.password);
    emit(state.copyWith(
      password: event.password,
      passwordError: passwordError,
      status: LoginStatus.initial,
    ));
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: LoginStatus.loading));

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // For demo purposes, any valid email/password combination will work
    emit(state.copyWith(status: LoginStatus.success));
  }
}