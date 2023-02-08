import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/auth/firebase_stream.dart';
import 'package:flutter_lavash/src/pages/sigin_page.dart';
import 'package:flutter_lavash/src/pages/sigup.dart';
import 'package:flutter_lavash/src/screens/main_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
        ),
      ),
      routes: {
        '/':(context) => const SigUpPage(),
        '/fire_stream': (context) => const FirebaseStream(),
        '/mainScreen': (context) => const MainScreen(),
      }
      
    );
  }
}
