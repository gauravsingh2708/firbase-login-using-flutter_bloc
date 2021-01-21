import 'package:firebase_login/bloc/login_bloc.dart';
import 'package:firebase_login/bloc/login_event.dart';
import 'package:firebase_login/bloc/login_state.dart';
import 'package:firebase_login/home.dart';
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
                    return bodyUi();
                  } else if (state is LoginLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoginFailState) {
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
                        bodyUi(),
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
  Widget bodyUi()=> Padding(
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
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter valid Email'
            ),
            controller: emailTextController,
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password'
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


// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   LoginRepository loginRepository = LoginRepository();
//   TextEditingController emailTextController = TextEditingController();
//   TextEditingController passTextController = TextEditingController();
//   LoginBloc loginBloc;
//   @override
//   Widget build(BuildContext context){
//     loginBloc = BlocProvider.of<LoginBloc>(context);
//     return Scaffold(
//     body: Form(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: BlocProvider(
//           create: (context) =>LoginBloc(loginRepository: loginRepository),
//           child: BlocBuilder<LoginBloc,LoginState>(
//             builder: (context,){},
//           ),
//         ),
//       ),
//     ),
//   );
//   }
// }
