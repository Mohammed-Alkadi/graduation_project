import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPatientScreen extends StatefulWidget {
  const SignUpPatientScreen({super.key});

  @override
  State<SignUpPatientScreen> createState() => _SignUpPatientScreenState();
}

class _SignUpPatientScreenState extends State<SignUpPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _invalidMobile = false;
  bool _invalidEmail = false;
  bool _invalidPassword = false;
  bool _invalidConfirmPassword = false;
  var _enteredMobile = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredConfirmPassword = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    // if (!isValid || !_isLogin) {
    //   return;
    // }

    // if (!_isLogin) {
    //   return;
    // }

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        TextEditingController().clear();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Account Information',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              enabled: false,
                              //bring name of patient from database and show here !
                              label: const Text('Nawaf Mohammed'),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              enabled: false,
                              //bring patient's birthdate from previous page !!
                              label: const Text('2001-06-14'),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              enabled: false,
                              // Bring gender from firebase database !
                              label: const Text('Male'),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          //use for mobile
                          TextFormField(
                            decoration: InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                              ),
                              // border: const OutlineInputBorder(),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              label: const Text('Mobile Number'),
                              floatingLabelStyle: _invalidMobile
                                  ? TextStyle(
                                      fontSize: 18,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    )
                                  : TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                    ),
                            ),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            enableInteractiveSelection: false,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            validator: (value) {
                              //لازم نضيف للشرط نتيجة التشييك على رقم بالفايربيس
                              final invMobile = value == null ||
                                  value.trim().isEmpty ||
                                  value.length != 10;
                              if (invMobile) {
                                setState(() {
                                  _invalidMobile = invMobile;
                                });
                                return 'please enter valid Mobile Number';
                              }
                              setState(() {
                                _invalidMobile = invMobile;
                              });
                              return null;
                            },
                            onSaved: (value) {
                              _enteredMobile = value!;
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
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                              ),
                              // border: const OutlineInputBorder(),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              label: const Text('Email'),
                              floatingLabelStyle: _invalidEmail
                                  ? TextStyle(
                                      fontSize: 18,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    )
                                  : TextStyle(
                                      fontSize: 18,
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
                              //لازم نضيف للشرط نتيجة التشييك على الايدي بالفايربيس
                              final invEmail = value == null ||
                                  value.trim().isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);

                              if (invEmail) {
                                setState(() {
                                  _invalidEmail = invEmail;
                                });
                                return 'please enter valid Email';
                              }
                              setState(() {
                                _invalidEmail = invEmail;
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
                            // Password
                            decoration: InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                              ),
                              // border: const OutlineInputBorder(),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              label: const Text('Password'),

                              floatingLabelStyle: _invalidPassword
                                  ? TextStyle(
                                      fontSize: 18,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    )
                                  : TextStyle(
                                      fontSize: 18,
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
                              final vpassword = value == null ||
                                  !RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{6,}$')
                                      .hasMatch(value);
                              if (vpassword) {
                                setState(() {
                                  _invalidPassword = vpassword;
                                });
                                return 'please enter a valid password';
                              }
                              _enteredPassword = value;
                              setState(() {
                                _invalidPassword = vpassword;
                              });
                              return null;
                            },

                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            // Confirm Password
                            decoration: InputDecoration(
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                ),
                              ),
                              // border: const OutlineInputBorder(),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              label: const Text('Confirm Password'),
                              helperText:
                                  'at least 8 characters in length\nat least one upper case\nat least one lower case \nat least one digit\nat least one Special character',
                              floatingLabelStyle: _invalidConfirmPassword
                                  ? TextStyle(
                                      fontSize: 18,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    )
                                  : TextStyle(
                                      fontSize: 18,
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
                              final confirmVpassword = value == null ||
                                  value.trim().length < 6 ||
                                  // _enteredPassword.compareTo(value) != 0
                                  _enteredPassword != value;
                              if (confirmVpassword) {
                                setState(() {
                                  _invalidConfirmPassword = confirmVpassword;
                                });
                                return 'password does not match !';
                              }
                              setState(() {
                                _invalidConfirmPassword = confirmVpassword;
                              });
                              return null;
                            },
                            onSaved: (value) {
                              _enteredConfirmPassword = value!;
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
                                'Finish',
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
