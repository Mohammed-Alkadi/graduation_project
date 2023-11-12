import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gp/screens/tabs.dart';
import 'package:gp/themes/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
// import 'package:gp/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:gp/screens/Auth/auth.dart';
// import 'package:gp/screens/tabs.dart';
import 'package:gp/themes/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterChat', theme: darkTheme, home: TabsScreen()
        // StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (ctx, snapshot) {
        //     if (snapshot.hasData) {
        //       return const TabsScreen();
        //     }
        //     return const AuthScreen();
        //   },
        // ),
        );
  }
}
