import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent {

  LoginButtonPressed({this.email, this.password});
  String email, password;
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
