import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/auth/verify_phone_number.dart';
import 'package:flutter_lavash/src/pages/profile.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class RegisterWithPhoneNumber extends StatefulWidget {
  @override
  State<RegisterWithPhoneNumber> createState() =>
      _RegisterWithPhoneNumberState();
}

class _RegisterWithPhoneNumberState extends State<RegisterWithPhoneNumber> {
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget _buildEmailTextField() {
      return TextFormField(
        inputFormatters: [
          MaskedInputFormatter("+7 (000) 000 00 00"),
        ],
        style: TextStyle(fontSize: 20),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Введите номер телефона',
          hintStyle: const TextStyle(
            color: Color(0xFFBDC2CB),
            fontSize: 20,
          ),
        ),
        controller: phoneNumberTextEditingController,
        validator: (value) {
          print(value);
          if (value!.isEmpty) {
            return 'Заполните поля';
          } else if (value.length < 18) {
            return 'Неверный формат телефона';
          } else {
            return null;
          }
        },
        //autovalidateMode: AutovalidateMode.onUserInteraction,
      );
    }

    var heigh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                
                const Text('Введите',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                     const Text('номер телефона',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              
                const SizedBox(height: 50),
                _buildEmailTextField(),
                const SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(15),
                          backgroundColor: MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyPhoneNumber(
                                    phoneNumber:
                                        phoneNumberTextEditingController.text,
                                  )),
                        );
                      },
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
