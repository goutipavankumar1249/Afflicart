import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'DashboardPage.dart';
import 'LoginPage.dart';
import 'SplashScreen.dart';
import 'SignupPage.dart';
import 'UserState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}
