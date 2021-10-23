import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'views/screens/auth_screen.dart';
import 'views/screens/chat_screen.dart';
import 'views/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
      future: _initialization,
      builder: (context, appSnapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: appSnapshot.connectionState != ConnectionState.done
              ? SplashScreen()
              : StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (ctx, userSnapshot) {
                    if (userSnapshot.hasData) {
                      return ChatScreen();
                    }
                    return AuthScreen();
                  },
                ),
        );
      },
    );
  }
}
