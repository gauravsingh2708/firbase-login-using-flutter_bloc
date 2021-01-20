import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context)=> Scaffold(
    body: Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
//            onSaved: (input) =>
//            validator: (input) =>
//            obscureText:
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Theme.of(context).accentColor),
                contentPadding: const EdgeInsets.all(12),
                hintText: 'Enter your Email',
                hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                prefixIcon: Icon(Icons.email, color: Theme.of(context).accentColor),
                suffixIcon: Icon(Icons.verified, color: Theme.of(context).accentColor),
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
              ),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              keyboardType: TextInputType.text,
//            onSaved: (input) =>
//            validator: (input) =>
//            obscureText:
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Theme.of(context).accentColor),
                contentPadding: const EdgeInsets.all(12),
                hintText: '••••••••••••',
                hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                prefixIcon: Icon(Icons.lock_outline, color: Theme.of(context).accentColor),
                suffixIcon: Icon(Icons.verified, color: Theme.of(context).accentColor),
                border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
              ),
            ),
            MaterialButton(
              onPressed:(){},
              height: 80,
              child: const Text('Login'),
            )
          ],
        ),
      ),
    ),
  );
}
