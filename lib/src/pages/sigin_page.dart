import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/pages/sigup.dart';
import 'package:flutter_lavash/src/widgets/snackbar.dart';

import '../widgets/show_dialog.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _tooggleVisibility = true;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Введите Email',
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
      ),
      validator: (email) {
        if (email != null && !EmailValidator.validate(email)) {
          return 'Введите правильный Email';
        } else {
          return null;
        }
      },
      controller: emailTextEditingController,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            _tooggleVisibility = !_tooggleVisibility;
            setState(() {});
          },
          icon: _tooggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _tooggleVisibility,
      validator: (value) =>
          value!.isEmpty ? 'Введите пароль' : null,
      controller: passwordTextEditingController,
    );
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showLoadingIndicator(context, 'Вход...');

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim());
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
            context, 'Неправильный email или пароль. Повторите попытку', true);
        return;
      } else {
        SnackBarService.showSnackBar(
            context,
            'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку',
            true);
        return;
      }
    }
    Navigator.of(context).pushReplacementNamed('/mainScreen');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Вход',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
                const SizedBox(height: 10),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      _buildEmailTextField(),
                      const SizedBox(height: 20),
                      _buildPasswordTextField(),
                    ]),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(15),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    onPressed: login,
                    child: const Text(
                      'Войти',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
                const Divider(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'У вас нет аккаунта?',
                    style: TextStyle(
                      color: Color(0xFFBDC2CB),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => SigUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
