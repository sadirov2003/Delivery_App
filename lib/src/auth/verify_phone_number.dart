import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/pages/profile.dart';
import 'package:flutter_lavash/src/screens/main_screen.dart';
import 'package:pinput/pinput.dart';

import '../widgets/snackbar.dart';

class VerifyPhoneNumber extends StatefulWidget {
  final String phoneNumber;
  VerifyPhoneNumber({
    required this.phoneNumber,
  });

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  bool resendCode = false;
  String? _veryficationCompleted;
  String? _pin;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          if (value.user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ),
            );
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          SnackBarService.showSnackBar(
              context, 'неправильный номер телефон', true);
        } else {
          SnackBarService.showSnackBar(
              context, 'Произошло ошибка попробуйте позже!', true);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _veryficationCompleted = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _veryficationCompleted = verificationId;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Timer? countdownTimer;
  int secondss = 60;

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      return setState(() {
        secondss--;

        if (secondss == 0) {
          countdownTimer!.cancel();
          resendCode = true;
        }
      });
    });
  }

  Future<void> resendingCodeAgain() async {
    secondss = 60;
    startTimer();
    _verifyPhone();

    setState(() {
      resendCode = false;
    });

    await Future.delayed(const Duration(seconds: 60));

    setState(() {
      resendCode = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'Введите СМС код,',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('отправленный на номер',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  ' +79505472004',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _veryficationCompleted!,
                        smsCode: pin,
                      ))
                          .then(
                        (value) {
                          if (value.user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
                          }
                        },
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'invalid-phone-number') {
                        SnackBarService.showSnackBar(
                            context, 'неправильный номер телефон', true);
                      } else if (_veryficationCompleted != pin) {
                        SnackBarService.showSnackBar(
                            context, 'не правильный код ввели', true);
                      } else {
                        SnackBarService.showSnackBar(context,
                            'Произошло ошибка попробуйте позже!', true);
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                resendCode
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.blue,
                          child: TextButton(
                            onPressed: resendingCodeAgain,
                            child: const Text(
                              'Отправить код еще раз',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Text(
                        'Отправить повторно через: $secondss сек.',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
