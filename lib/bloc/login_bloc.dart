import 'package:firebase_login/bloc/login_state.dart';
import 'package:firebase_login/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({LoginRepository loginRepository}) {
    loginRepository = loginRepository;
  }

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        var user = await loginRepository.logInWithEmailAndPassword(email: event.email,password: event.password);
        yield LoginSuccessState(user);
      } catch (e) {
        yield LoginFailState(e.toString());
      }
    }
  }
}

