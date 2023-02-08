import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartEvent extends AuthEvents {}

class LoginButtonPressed extends AuthEvents {
  final String email;
  final String password;
  LoginButtonPressed({required this.email, required this.password});
}
// class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
//   ArticleBloc() : super(ArticleInitial()) {
//     on<FetchArticlesEvent>((event, emit) {
//       //TODO
//     });
//   }
// }
// on<LoginButtonPressed>((event, emit) {
//   inal String email;
//   final String password;
//   LoginButtonPressed({required this.email, required this.password});
// })
// abstract class AuthenticationEvent extends Equatable {
//   const AuthenticationEvent();
//   @override
//   List<Object> get props => [];
// }

// class Appstarted extends AuthenticationEvent {}

// class LoggedIn extends AuthenticationEvent {
//   final String token;
//   const LoggedIn({required this.token});
//   @override
//   List<Object> get props => [token];
//   @override
//   String toString() => 'LoggedIn{$token}';
// }

// class LoggedOut extends AuthenticationEvent {}
