import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitState extends AuthState {}

class LoginLogingState extends AuthState {}

class UserLoginSuccessState extends AuthState {}

class AdminLoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;
  LoginErrorState({required this.message});
}
// abstract class AuthenticationState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class AuthenticationUninitialized extends AuthenticationState {}

// class AuthenticationAuthenticated extends AuthenticationState {}

// class AuthenticationUnauthenticated extends AuthenticationState {}

// class AuthenticationLoading extends AuthenticationState {}
