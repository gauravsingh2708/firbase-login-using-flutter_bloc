import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState  {}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => null;
}

class LoginSuccessState extends LoginState {
  LoginSuccessState(this.user);
  User user;
  @override
  List<Object> get props => null;
}

class LoginFailState extends LoginState {
  LoginFailState(this.message);
  String message;
  @override
  List<Object> get props => null;
}