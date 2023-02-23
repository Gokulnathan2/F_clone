part of '../login_controller.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginCompleted extends LoginState {
  final LoginResponseModel loginModel;

  const LoginCompleted(this.loginModel);
}

class EnvironmentInitial extends LoginState {
  const EnvironmentInitial();
}

class EnvironmentLoading extends LoginState {
  const EnvironmentLoading();
}

class EnvironmentCompleted extends LoginState {
  final LoginResponseModel loginModel;

  const EnvironmentCompleted(this.loginModel);
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);
}
