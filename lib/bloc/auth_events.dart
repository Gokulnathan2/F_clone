import 'package:equatable/equatable.dart';

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
