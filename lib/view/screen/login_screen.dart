import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/bloc/login/login_bloc.dart';
import 'package:flutter_movies/bloc/login/login_event.dart';
import 'package:flutter_movies/bloc/login/login_state.dart';
import 'package:flutter_movies/models/authentication/login_body.dart';
import 'package:flutter_movies/utils/preference_util.dart';

import 'package:flutter_movies/view/screen/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<LoginBloc>(context),
      listener: (context, state) {
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Failed'),
              duration: Duration(
                microseconds: 500,
              ),
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 250,
                    width: 250,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your username or password';
                                }
                              },
                              controller: _usernameCtrl,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your username or password';
                                }
                              },
                              obscureText: true,
                              controller: _passwordCtrl,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 60,
                      child: BlocListener(
                          bloc: BlocProvider.of<LoginBloc>(context),
                          listener: (context, state) {
                            if (state is LoginSuccess) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()));
                            }
                          },
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final LoginBody body = LoginBody(
                                    username: _usernameCtrl.text,
                                    password: _passwordCtrl.text,
                                    request_token: PreferenceUtils.getString(
                                        'requestToken'));
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginButtonEvent(loginBody: body));
                                // BlocListener(
                                //   bloc: BlocProvider.of<LoginBloc>(context),
                                //   listener: (context, state) {
                                //     if (state is LoginSuccess) {
                                //       Navigator.of(context).pushReplacement(
                                //           MaterialPageRoute(
                                //               builder: (_) => HomeScreen()));
                                //     }
                                //   },
                                //   child: Container(),
                                // );
                              } else {
                                Fluttertoast.showToast(msg: 'Login Failed!');
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ))),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Facebook',
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Google',
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
