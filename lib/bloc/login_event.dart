import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed({this.email, this.password});
  String email, password;
  @override
  List<Object> get props => throw UnimplementedError();
}
