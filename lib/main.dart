import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/screens/auth.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
          textTheme: GoogleFonts.latoTextTheme().copyWith(
              titleLarge: const TextStyle(
            color: Color.fromARGB(255, 247, 248, 253),
          )),
          useMaterial3: true,
          colorScheme: const ColorScheme.dark(
            background: Color.fromARGB(255, 8, 14, 32),
            primary: Color.fromARGB(255, 28, 46, 109), // button color
            onPrimary: Color.fromARGB(255, 247, 248, 253), //text color
            secondary: Color.fromARGB(255, 13, 20, 49), // meta's containers
            primaryContainer:
                Color.fromARGB(255, 16, 22, 39), //nawaf's containers
            secondaryContainer: Color.fromARGB(255, 60, 92, 205), //accent
          )),
      home: const AuthScreen(),
    );
  }
}
