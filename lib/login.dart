import 'package:firebase_login/bloc/login_bloc.dart';
import 'package:firebase_login/bloc/login_event.dart';
import 'package:firebase_login/bloc/login_state.dart';
import 'package:firebase_login/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginPage extends StatelessWidget {
  LoginRepository loginRepository = LoginRepository();
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => LoginBloc(loginRepository: loginRepository),
    child: LoginPageUi(),
    );
}

class LoginPageUi extends StatelessWidget {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  LoginBloc loginBloc;
  final _formKey = GlobalKey<FormState>();
  bool validatePass(bool cond)=> cond;
  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocListener<LoginBloc,LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessState) {
                }
              },
              child: BlocBuilder<LoginBloc,LoginState>(
                builder: (context,state){
                  if (state is LoginInitialState) {
                    return bodyUi(context, state);
                  } else if (state is LoginLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (state is LoginFailState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 100,),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Error ${state.message}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                        bodyUi(context,state),
                      ],
                    );
                  } else if (state is LoginSuccessState) {
                    emailTextController.text = '';
                    passTextController.text = '';
                    return Container(
                      child: const Center(
                        child: Text('Home Page',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                      ),
                    );
                  }
                  return Container();
                }
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget bodyUi(BuildContext context, LoginState state)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical:80.0),
            child: Text('Login',style: TextStyle(fontSize: 40,color: Colors.blue,fontWeight: FontWeight.w500),),
          ),
          TextFormField(
            onChanged: (email)=> loginBloc.add(ValidateEmail(email: email)),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter valid Email',
              errorText: !loginBloc.getEmailVal?'Enter correct Email': null,
            ),
            controller: emailTextController,
          ),
          const SizedBox(height: 20,),
          TextFormField(
            onChanged: (password)=> loginBloc.add(ValidatePassword(password: password)),
            decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
                errorText: !loginBloc.getPassVal?'Enter correct Password': null,
            ),
            controller: passTextController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:80.0),
            child: FlatButton(onPressed:(){
              loginBloc.add(
                LoginButtonPressed(email: emailTextController.text,password: passTextController.text),
              );
            }, child: const Text('Login',style: TextStyle(color: Colors.white),),color: Colors.blue,),
          )
        ],
      ),
  );
}

