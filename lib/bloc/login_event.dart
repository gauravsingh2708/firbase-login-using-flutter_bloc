import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

// ignore: must_be_immutable
class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed({this.email, this.password});
  String email, password;
  @override
  List<Object> get props => [];
}

class ValidateEmail extends LoginEvent{
  ValidateEmail({this.email});
  String email;
  @override
  List<Object> get props => throw UnimplementedError();

}

// ignore: must_be_immutable
class ValidatePassword extends LoginEvent{
  ValidatePassword({this.password});
  String password;
  @override
  List<Object> get props => throw UnimplementedError();
}
