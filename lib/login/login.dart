// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../navigator.dart';

void main() => runApp(Login());

const users = const {
  'cliveduncanjr@gmail.com': 'password1',
  'beaug@gmail.com': 'password2'
};

class Login extends StatelessWidget {
  Duration get loginTime => Duration(microseconds: 2250);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User does not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return '';
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User does not exist';
      }
      return '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Handi',
      logo: 'assets/icons/logo.png',
      theme: LoginTheme(
        primaryColor: Colors.blue[800],
        pageColorLight: Colors.blue[600],
        logoWidth: 1,
        titleStyle: GoogleFonts.poppins(
            textStyle: TextStyle(fontWeight: FontWeight.w600)),
      ),
      navigateBackAfterRecovery: true,
      onSignup: _authUser,
      onLogin: _authUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainContainer()));
      },
      loginProviders: <LoginProvider>[
        LoginProvider(
            icon: FontAwesomeIcons.google,
            callback: () async {
              print('Start google sign in');
              await Future.delayed(loginTime);
              return null;
            }),
        LoginProvider(
            icon: FontAwesomeIcons.facebookF,
            callback: () async {
              print('Start facebook sign in');
              await Future.delayed(loginTime);
              return null;
            }),
        LoginProvider(
            icon: FontAwesomeIcons.apple,
            callback: () async {
              print('Start Apple sign in');
              await Future.delayed(loginTime);
              return null;
            })
      ],
    );
  }
}
