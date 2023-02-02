import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gokul_f/bloc/auth_events.dart';
import 'package:gokul_f/bloc/auth_state.dart';
import 'package:gokul_f/repository/auth_repo.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthRepository repo;
  AuthBloc(AuthState initialState, this.repo) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvents event) async* {
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginButtonPressed) {
      yield LoginLogingState();
      var data = await repo.login(event.email, event.password);
      //var rsc = await repo.login(res.statuscode);
      if (data['types'] == 'manager') {
        yield UserLoginSuccessState();
      } else if (data['type'] == 'manager') {
        yield AdminLoginSuccessState();
      } else {
        yield LoginErrorState(message: 'auth err');
      }
    }
  }
}
