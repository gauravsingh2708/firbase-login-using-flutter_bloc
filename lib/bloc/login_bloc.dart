


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/bloc/login_event.dart';
import 'package:firebase_login/bloc/login_state.dart';
import 'package:firebase_login/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc({LoginRepository loginRepository}) {
    loginRepository = loginRepository;
  }
  LoginRepository loginRepository;
  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        print('${event.email}   ${event.password}');
        var user = await LoginRepository().logInWithEmailAndPassword(email: event.email,password: event.password);
        yield LoginSuccessState(user);
      } catch (e) {
        print(e.toString());
        yield LoginFailState(e.toString());
      }
    }
  }
}
