import 'package:flutter/material.dart';
import 'package:my_grocery_app/constants/text_strings.dart';

import '../../../functions/auth_functions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullName = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(tLogin),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              login
                  ? Container()
                  : TextFormField(
                key: const ValueKey('fullName'),
                decoration: const InputDecoration(
                  hintText: 'Enter Full Name'
                ),
                validator: (value){
                  if(value!.isEmpty){
                  return 'Please Enter Full Name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    fullName = value!;
                  });
                },
              ),
              TextFormField(
                key: const ValueKey('email'),
                decoration: const InputDecoration(
                    hintText: 'Enter Email'
                ),
                validator: (value){
                  if(value!.isEmpty || !value.contains('@')){
                    return 'Please Enter valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                key: const ValueKey('password'),
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Enter Password',
                ),
                validator: (value){
                  if(value!.length < 6){
                    return 'Please Enter Password of min length 6 ';
                  } else {
                    return null;
                  }
                },
                onSaved: (value){
                  setState(() {
                    password = value!;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      _formkey.currentState!.save();
                      login
                          ? AuthServices.signinUser(email,password, context)
                          : AuthServices.signupUser(email,password,fullName,context);
                    }
                  },
                  child: Text(login? tLogin : tSignup),
              ),),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: (){
                    setState(() {
                      login = true;
                    });
                    },
                  child: const Text('Already have an account? Login')),
            ],
          ),
        ),
      ),
    );
  }
}
