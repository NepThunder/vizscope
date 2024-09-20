import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:vizscope/pages/login_authentication.dart';
import 'package:vizscope/pages/home.dart';
import 'package:vizscope/pages/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  Logger logger = Logger();

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    await dotenv.load(fileName: ".env");
  } catch (e) {
    logger.e(e.toString());
  }

  runApp(const Routepath());
}

class Routepath extends StatelessWidget {
  const Routepath({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/authentication': (context) => const LoginAuthentication(),
        '/home': (context) => const Home(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
