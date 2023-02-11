import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/pages/sigin_page.dart';
import 'package:flutter_lavash/src/widgets/snackbar.dart';

import '../widgets/show_dialog.dart';

class SigUpPage extends StatefulWidget {
  const SigUpPage({super.key});

  @override
  State<SigUpPage> createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  TextEditingController usernameTextInputController = TextEditingController();
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool _toggleVisibility = true;
  bool _toggleConfirmVisibility = true;

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();
    usernameTextInputController.dispose();
    super.dispose();
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Введите Email',
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
      ),
      controller: emailTextInputController,
      validator: (email) {
        return email != null && !EmailValidator.validate(email)
            ? 'Введите правильный Email'
            : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildUsernameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Имя пользователя',
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
      ),
      controller: usernameTextInputController,
      validator: (username) {
        if (username!.isEmpty) {
          return 'Объязательное для заполнения';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Ввведите пароль',
        hintStyle: const TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            _toggleVisibility = !_toggleVisibility;
            setState(() {});
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
      controller: passwordTextInputController,
      validator: (value) =>
          value != null && value.length < 6 ? 'Минимум 6 символов' : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      
      decoration: InputDecoration(
        hintText: 'Введите пароль еще раз',
        hintStyle: const TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            _toggleConfirmVisibility = !_toggleConfirmVisibility;
            setState(() {});
          },
          icon: _toggleConfirmVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleConfirmVisibility,
      controller: passwordTextRepeatInputController,
      validator: (value) =>
          value != null && value.length < 6 ? 'Минимум 6 символов' : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  void signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (passwordTextInputController.text !=
        passwordTextRepeatInputController.text) {
      SnackBarService.showSnackBar(context, 'Пароли должны совпадать', true);

      return;
    }

    showLoadingIndicator(context, 'Регистрация...');

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextInputController.text.trim(),
          password: passwordTextInputController.text.trim());
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
            context,
            'Такой Email уже используется, повторите попытку с использованием другого Email',
            true);

        return;
      } else {
        SnackBarService.showSnackBar(
            context,
            'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку',
            true);
      }
    }
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/fire_stream', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    
                    const Text(
                      'Регистрация',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: [
                          _buildUsernameTextField(),
                          const SizedBox(height: 20),
                          _buildEmailTextField(),
                          const SizedBox(height: 20),
                          _buildPasswordTextField(),
                          const SizedBox(height: 20),
                          _buildConfirmPasswordTextField()
                          
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
                          onPressed: signUp,
                          child: const Text(
                            'Готово',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'У вас уже есть аккаунт?',
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
                              builder: (BuildContext context) => SignInPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Войти',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
