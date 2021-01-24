


import 'package:firebase_login/bloc/login_event.dart';
import 'package:firebase_login/bloc/login_state.dart';
import 'package:firebase_login/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc({LoginRepository loginRepository}) {loginRepository = loginRepository;}
  LoginRepository loginRepository;

  bool _emailValidated = true;
  bool _passwordValidated = true;

  bool get getEmailVal => _emailValidated;
  bool get getPassVal => _passwordValidated;
  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        var user = await LoginRepository().logInWithEmailAndPassword(email: event.email,password: event.password);
        yield LoginSuccessState(user);
      } catch (e) {
        print(e.toString());
        yield LoginFailState(e.toString());
      }
    }
    if(event is ValidateEmail){
      print('Validate email event is called');
      if(event.email.contains('@') && event.email.contains('.')){
        _emailValidated = true;
        yield LoginInitialState();
      }
      else{
        _emailValidated = false;
        yield LoginInitialState();
      }
      print(_emailValidated);
    }
    if(event is ValidatePassword){
      var  pattern = r'@';
      var regExp = RegExp(pattern);
      if(regExp.hasMatch(event.password)){
        _passwordValidated = true;
        yield LoginInitialState();
      }
      else{
        _passwordValidated = false;
        yield LoginInitialState();
      }
    }
  }
}
