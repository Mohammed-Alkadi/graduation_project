import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _firebase = FirebaseAuth.instance;
    // var userEmail;
    // final _currentUser = FirebaseAuth.instance.currentUser;
    // if (_currentUser != null) {
    //   userEmail = _currentUser.email.toString();
    // }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 0,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 350,
                child: Image.asset(
                  'assets/images/Welcome.png',
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  'Welcome',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  'Your Health is our priority.',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
              //signout button
              ElevatedButton(
                onPressed: () {
                  _firebase.signOut();
                },
                child: Text('SignOut!'),
              ),
            ],
          ),
        ),
      ),
    );
    // Column(
    //   children: [
    //     // Text(userEmail),
    //     ElevatedButton(
    //         onPressed: () {
    //           FirebaseAuth.instance.signOut();
    //         },
    //         child: Text('SignOut ! '))
    //   ],
    // );
  }
}
