import 'package:flutter/material.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Account Information ',
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
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  width: 2,
                                  style: BorderStyle.none,
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
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              enabled: false,
                              label: const Text('Nawaf Mohammed'),
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
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              enabled: false,
                              label: const Text('2001-06-14'),
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
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              enabled: false,
                              label: const Text('Male'),
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
                              border: const OutlineInputBorder(),
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
                            validator: (value) {
                              //لازم نضيف للشرط نتيجة التشييك على الايدي بالفايربيس
                              final invMobile = value == null ||
                                  value.trim().isEmpty ||
                                  value.length != 10 ||
                                  value.contains('.') ||
                                  value.contains('-') ||
                                  value.contains(',') ||
                                  value.contains(' ');
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
                              border: const OutlineInputBorder(),
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
                            keyboardType: TextInputType.number,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            enableInteractiveSelection: false,
                            validator: (value) {
                              //لازم نضيف للشرط نتيجة التشييك على الايدي بالفايربيس
                              final invEmail = value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@');
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
                              border: const OutlineInputBorder(),
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
                              final vpassword =
                                  value == null || value.trim().length < 6;
                              if (vpassword) {
                                setState(() {
                                  _invalidPassword = vpassword;
                                });
                                return 'password must be at least 6 characters long';
                              }
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
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              label: const Text('Confirm Password'),
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
                              final confirmVpassword =
                                  value == null || value.trim().length < 6;
                              if (confirmVpassword) {
                                setState(() {
                                  _invalidConfirmPassword = confirmVpassword;
                                });
                                return 'password must be at least 6 characters long';
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
                              onPressed: () {},
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
