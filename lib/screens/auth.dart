// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field (for date)

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field (for date)
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _isPatient = true;
  var _isDoctor = false;
  var _enteredEmail = '';
  var _enteredId = '';
  var _enteredPassword = '';
  var _enteredDate = '';
  bool _inValidEmail = false;
  bool _invalidId = false;
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
                child: Image.asset(
                  'assets/images/Logo.png',
                ),
              ),
              Text(
                _isPatient
                    ? 'Your Health is our priority ! '
                    : "Your patients are waiting, Doc ! ",
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
                              const SizedBox(width: 8),
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
                            label: const Text('National id / Iqama id'),
                            floatingLabelStyle: _invalidId
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
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          enableInteractiveSelection: false,
                          validator: (value) {
                            //لازم نضيف للشرط نتيجة التشييك على الايدي بالفايربيس
                            final invId = value == null ||
                                value.trim().isEmpty ||
                                value.length != 10 ||
                                value.contains('.') ||
                                value.contains('-') ||
                                value.contains(',') ||
                                value.contains(' ');
                            if (invId) {
                              setState(() {
                                _invalidId = invId;
                              });
                              return 'please enter valid id';
                            }
                            setState(() {
                              _invalidId = invId;
                            });
                            return null;
                          },
                          onSaved: (value) {
                            _enteredId = value!;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        _isLogin
                            ? TextFormField(
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
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary,
                                  label: const Text('Password'),
                                  floatingLabelStyle: _inValidPassword
                                      ? TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        )
                                      : TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondaryContainer,
                                        ),
                                ),
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
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
                              )
                            : TextFormField(
                                // date for sign up
                                controller:
                                    dateinput, //editing controller of this TextField
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
                                  fillColor:
                                      Theme.of(context).colorScheme.secondary,
                                  label: const Text('Date of Birth'),
                                  // floatingLabelStyle: _inValidPassword
                                  //     ? TextStyle(
                                  //         color: Theme.of(context)
                                  //             .colorScheme
                                  //             .error,
                                  //       )
                                  //     : TextStyle(
                                  //         color: Theme.of(context)
                                  //             .colorScheme
                                  //             .secondaryContainer,
                                  //       ),
                                ),
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                readOnly:
                                    true, //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                      // edit colors of date picker here --------
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.dark(
                                              primary: Theme.of(context)
                                                  .colorScheme
                                                  .secondaryContainer, // header background color
                                              onPrimary: Colors
                                                  .black, // header text color
                                              onSurface: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary, // body text color
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                foregroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onPrimary,
                                              ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      });

                                  if (pickedDate != null) {
                                    //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    //formatted date output using intl package =>  2021-03-16
                                    //you can implement different kind of Date Format here according to your requirement

                                    setState(() {
                                      dateinput.text = formattedDate;
                                      _enteredDate =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {
                                    setState(() {
                                      dateinput.text = '';
                                    });
                                  }
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
                              _isLogin ? 'Login' : 'Signup',
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
                                  dateinput.text = ''; // for date
                                  _enteredDate = ''; // for date
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
