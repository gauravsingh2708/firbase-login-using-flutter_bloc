import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {
  List<Object> get props => null;
}

class LoginLoadingState extends LoginState {
  List<Object> get props => null;
}

class LoginSuccessState extends LoginState {
  LoginSuccessState(this.user);
  User user;
  List<Object> get props => null;
}

class LoginFailState extends LoginState {
  LoginFailState(this.message);
  String message;
  List<Object> get props => null;
}