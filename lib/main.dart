import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkingmanagement/screens/availability.dart';
import 'package:parkingmanagement/screens/bookparking.dart';
import 'package:parkingmanagement/screens/loginscreen.dart';
import 'package:parkingmanagement/screens/loginusermenu.dart';
import 'package:parkingmanagement/screens/mainscreen.dart';
import 'package:parkingmanagement/screens/newuserpage.dart';
import 'package:parkingmanagement/screens/parkingpolicy.dart';
import 'package:parkingmanagement/screens/parkingstatus.dart';
import 'package:provider/provider.dart';

import 'authentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          initialData: () {},
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Confluence',
        debugShowCheckedModeBanner: false,

        // home: MainApp(),
        home: MainScreen(),
        // home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      print("signed In");
      // HomePage();
    }
    print("not signed In");
  }
}
