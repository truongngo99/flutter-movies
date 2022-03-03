import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/data/post/api.dart';
import 'package:flutter_movies/data/response/authentication/login_body.dart';
import 'package:flutter_movies/utils/preference_util.dart';
import 'package:flutter_movies/view/home.dart';

import 'package:flutter_movies/view/login/login_bloc.dart';
import 'package:flutter_movies/view/login/login_event.dart';
import 'package:flutter_movies/view/login/login_state.dart';
import 'package:flutter_movies/view/widget/odevider.dart';
import 'package:flutter_movies/view/widget/social_icon.dart';

import 'package:teq_flutter_core/teq_flutter_core.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseBlocState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  //bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => bloc as LoginBloc),
        ],
        child: BaseBlocConsumer<LoginStateSuccess>(
            bloc as LoginBloc, _buildBody, _buildListen));
  }

  @override
  BaseBloc createBloc() => LoginBloc(context.read<Api>());
  _buildListen(BuildContext context, LoginStateSuccess state) {
    if (state.isError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Failed'),
          duration: Duration(
            seconds: 1,
          ),
        ),
      );
    } else if (state.requestToken != null &&
        state.requestToken!.success == true) {
      return transferToNewScreen(context, HomeScreen());
    }
  }

  Widget _buildBody(BuildContext context, LoginStateSuccess state) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f5),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your username or password';
                            }
                          },
                          controller: _usernameCtrl,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Color(0xffff9a6f)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xffff9a6f),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
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
                            hintStyle: TextStyle(color: Color(0xffff9a6f)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xffff9a6f),
                            ),
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
                width: MediaQuery.of(context).size.width - 77,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final LoginBody body = LoginBody(
                          username: _usernameCtrl.text,
                          password: _passwordCtrl.text,
                          request_token:
                              PreferenceUtils.getString('requestToken'));
                      addEvent(LoginButtonEvent(loginBody: body));
                    }
                  },
                  child: state.isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          'Login',
                          style: TextStyle(fontSize: 24),
                        ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffff5f1b),
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              OrDivider(
                text: 'OR',
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                    iconSrc: 'assets/images/facebook.svg',
                    onPress: () {},
                  ),
                  SocialIcon(
                    iconSrc: 'assets/images/google-plus.svg',
                    onPress: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
