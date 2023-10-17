import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _isPatient = true;
  var _isDoctor = false;
  var _enteredEmail = '';
  var _enteredPassword = '';
  bool _inValidEmail = false;
  bool _inValidPassword = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid || !_isLogin) {
      return;
    }

    if (!_isLogin) {
      return;
    }

    _formKey.currentState!.save();
    // try {
    //   if (_isLogin) {
    //     final userCred = await _firebase.signInWithEmailAndPassword(
    //         email: _enteredEmail, password: _enteredPassword);
    //   } else {
    //     final userCred = await _firebase.createUserWithEmailAndPassword(
    //         email: _enteredEmail, password: _enteredPassword);

    //     }
    //   } on FirebaseAuthException catch (error) {
    //     if (error.code == 'email-already-in-use') {}
    //     ScaffoldMessenger.of(context).clearSnackBars();
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(error.message ?? 'Auth failed'),
    //       ),
    //     );
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          margin: const EdgeInsets.fromLTRB(0, 16, 200, 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // style: ElevatedButton.styleFrom(
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(8),
                              //   ),

                              TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: _isPatient
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPatient = true;
                                    _isDoctor = false;
                                  });
                                },
                                child: Text(
                                  'Patient',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                              ),
                              SizedBox(width: 8),
                              TextButton(
                                style: TextButton.styleFrom(
                                  shadowColor:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: _isDoctor
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPatient = false;
                                    _isDoctor = true;
                                  });
                                },
                                child: Text(
                                  'Doctor',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.secondary,
                            label: const Text('Email Address'),
                            floatingLabelStyle: _inValidEmail
                                ? TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  )
                                : TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                  ),
                          ),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            final vemail = value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@');
                            if (vemail) {
                              setState(() {
                                _inValidEmail = vemail;
                              });
                              return 'please enter valid email';
                            }
                            setState(() {
                              _inValidEmail = vemail;
                            });
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.secondary,
                            label: const Text('Password'),
                            floatingLabelStyle: _inValidPassword
                                ? TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  )
                                : TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                  ),
                          ),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          obscureText: true,
                          validator: (value) {
                            final vpassword =
                                value == null || value.trim().length < 6;
                            if (vpassword) {
                              setState(() {
                                _inValidPassword = vpassword;
                              });
                              return 'password must be at least 6 characters long';
                            }
                            setState(() {
                              _inValidPassword = vpassword;
                            });
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary),
                            child: Text(
                              _isLogin ? 'Login' : 'signup',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin
                                    ? 'create an account'
                                    : 'already have an account',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                            ),
                            Text(
                              'Forget your passowrd?',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.error),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
