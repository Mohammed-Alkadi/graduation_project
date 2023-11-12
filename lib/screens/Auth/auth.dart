// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp/models/patients.dart';
import 'package:gp/screens/Auth/signuppatient.dart';
import 'package:gp/screens/Auth/signupdoctor.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

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

  FocusNode _focus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _isPatient = true;
  var _isDoctor = false;
  var _enteredEmail = '';
  var _enteredId = '';
  var _enteredPassword = '';
  var _enteredDate = '';
  bool _invalidEmail = false;
  bool _invalidId = false;
  bool _invalidPassword = false;
  bool _invalidDate = false;
  bool _invalidCreds = true;
  bool _userExists = false;
  bool _invalidLoginCreds = false;
  bool _isLoading = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    _formKey.currentState!.save();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      final pUserSnap = await _firestore
          .collection('nafees')
          .where('nationalid', isEqualTo: _enteredId)
          .get();
      //gets the records that have id in the patients collection equal to id entered by user (0 or 1)
      final patientSnap = await _firestore
          .collection('patients')
          .where('nationalid', isEqualTo: _enteredId)
          .get();

      //one record is spoused to be found in nafeesdocotrs collection
      final dUserSnap = await _firestore
          .collection('nafeesdoctors')
          .where('nationalid', isEqualTo: _enteredId)
          .get();

      //gets the records that have id in the doctor collection equal to id entered by user (0 or 1)
      final doctorSnap = await _firestore
          .collection('doctors')
          .where('nationalid', isEqualTo: _enteredId)
          .get();

      void _patientLogin() async {
        if (patientSnap.docs.length == 1) {
          var _patientEmail = patientSnap.docs[0]['email'];
          try {
            final pUserCreds = await _firebaseAuth.signInWithEmailAndPassword(
                email: _patientEmail, password: _enteredPassword);
          } on FirebaseAuthException catch (e) {
            setState(() {
              _invalidLoginCreds = true;
              _isLoading = false;
            });
          }
        } else {
          setState(() {
            _invalidLoginCreds = true;
            _isLoading = false;
          });
        }
      }

      void _patientSignUp() async {
        if (pUserSnap.docs.isNotEmpty) {
          Timestamp timestamp = pUserSnap.docs[0].get('birthdate');
          DateTime d = timestamp.toDate();
          String formattedDate = DateFormat('yyyy-MM-dd').format(d);
          print(formattedDate.toString());
          if (patientSnap.docs.isEmpty && formattedDate == _enteredDate) {
            var pUserName = pUserSnap.docs[0].get('name').toString();
            print(pUserName);
            var dUserGender = pUserSnap.docs[0].get('gender').toString();
            print(dUserGender);
            setState(() {
              _invalidCreds = true;
              _userExists = false;
              _isLoading = false;
            });
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (ctx) => SignUpPatientScreen(
                      patientName: pUserName,
                      patientBd: _enteredDate,
                      patientGender: dUserGender,
                      nationalId: _enteredId)),
            );
          }
          if (!_isLogin &&
              _isPatient &&
              patientSnap.docs.isNotEmpty &&
              formattedDate == _enteredDate) {
            setState(() {
              _invalidCreds = true;
              _userExists = true;
              _isLoading = false;
            });
          }
          if (!_isLogin && _isPatient && formattedDate != _enteredDate) {
            setState(() {
              _invalidCreds = false;
              _isLoading = false;
            });
          }
        } else {
          setState(() {
            _invalidCreds = false;
            _isLoading = false;
          });
        }
      }

      if (!_isLogin && _isPatient) {
        _patientSignUp();
      }
      if (_isLogin && _isPatient) {
        _patientLogin();
      }
      // if (!isValid || !_isLogin) {
      //   return;
      // }

      void _doctorLogin() async {
        if (doctorSnap.docs.length == 1) {
          var _doctorEmail = doctorSnap.docs[0]['email'];
          try {
            final dUserCreds = await _firebaseAuth.signInWithEmailAndPassword(
                email: _doctorEmail, password: _enteredPassword);
          } on FirebaseAuthException catch (e) {
            setState(() {
              _invalidLoginCreds = true;
              _isLoading = false;
            });
          }
        } else {
          setState(() {
            _invalidLoginCreds = true;
            _isLoading = false;
          });
        }
      }

      void _doctorSignUp() async {
        if (dUserSnap.docs.isNotEmpty) {
          Timestamp timestamp = dUserSnap.docs[0].get('birthdate');
          DateTime d = timestamp.toDate();
          String formattedDate = DateFormat('yyyy-MM-dd').format(d);
          print(formattedDate.toString());
          print(_enteredDate);

          if (doctorSnap.docs.isEmpty && formattedDate == _enteredDate) {
            var dUserName = dUserSnap.docs[0].get('name').toString();

            var dUserGender = dUserSnap.docs[0].get('gender').toString();

            var doctorLevel = dUserSnap.docs[0].get('level').toString();

            var doctorSpecialty = dUserSnap.docs[0].get('specialty').toString();

            var doctorNumber = dUserSnap.docs[0].get('pracnumber').toString();

            setState(() {
              _invalidCreds = true;
              _userExists = false;
              _isLoading = false;
            });
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (ctx) => SignUpDoctorScreen(
                      doctorBd: _enteredDate,
                      doctorGender: dUserGender,
                      doctorLevel: doctorLevel,
                      doctorName: dUserName,
                      nationalId: _enteredId,
                      doctorNumber: doctorNumber,
                      doctorSpecialty: doctorSpecialty)),
            );
          }
          if (!_isLogin &&
              _isDoctor &&
              doctorSnap.docs.isNotEmpty &&
              formattedDate == _enteredDate) {
            setState(() {
              _invalidCreds = true;
              _userExists = true;
              _isLoading = false;
            });
          }
          if (!_isLogin && _isDoctor && formattedDate != _enteredDate) {
            setState(() {
              _invalidCreds = false;
              _isLoading = false;
            });
          }
        } else {
          setState(() {
            _invalidCreds = false;
            _isLoading = false;
          });
        }
      }

      if (!_isLogin && _isDoctor) {
        _doctorSignUp();
      }
      if (_isLogin && _isDoctor) {
        _doctorLogin();
      }
    }
    //one record is spoused to be found in nafees collection
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isLogin)
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
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _formKey.currentState!.reset();
                                      _isPatient = true;
                                      _isDoctor = false;
                                      FocusScope.of(context).unfocus();
                                      TextEditingController().clear();
                                      _invalidDate = false;
                                      _invalidId = false;
                                      _invalidPassword = false;
                                      dateinput.text = '';
                                      _invalidCreds = true;
                                      _userExists = false;
                                      _invalidLoginCreds = false;
                                      _enteredId = "";
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
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _formKey.currentState!.reset();
                                      _isPatient = false;
                                      _isDoctor = true;
                                      FocusScope.of(context).unfocus();
                                      TextEditingController().clear();
                                      _invalidDate = false;
                                      _invalidId = false;
                                      _invalidPassword = false;
                                      dateinput.text = '';
                                      _invalidCreds = true;
                                      _userExists = false;
                                      _invalidLoginCreds = false;
                                      _enteredId = "";
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

                          //error message for wrong creds
                          if (!_invalidCreds || _invalidLoginCreds)
                            Text(
                              'Wrong Credintials !',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            )
                          else if (_userExists)
                            Text(
                              'An account already exists!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                            ),

                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            initialValue:
                                _enteredId.isNotEmpty ? _enteredId : null,
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
                              filled: true,
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              label: const Text('National id / Iqama id'),
                              floatingLabelStyle: _invalidId
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
                              //لازم نضيف للشرط نتيجة التشييك على الايدي بالفايربيس
                              final invId = value == null ||
                                  value.trim().isEmpty ||
                                  value.length != 10;
                              if (invId) {
                                setState(() {
                                  _invalidId = invId;
                                });
                                return 'please enter a valid id';
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
                                        color:
                                            Theme.of(context).colorScheme.error,
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
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).colorScheme.secondary,
                                    label: const Text('Password'),
                                    floatingLabelStyle: _invalidPassword
                                        ? TextStyle(
                                            fontSize: 18,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .error,
                                          )
                                        : TextStyle(
                                            fontSize: 18,
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
                                    final vpassword = value == null;

                                    if (vpassword) {
                                      setState(() {
                                        _invalidPassword = vpassword;
                                      });
                                      return 'Enter password please !';
                                    }
                                    setState(() {
                                      _invalidPassword = vpassword;
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
                                        width: 2,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color:
                                            Theme.of(context).colorScheme.error,
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
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).colorScheme.secondary,
                                    label: const Text('Date of Birth'),
                                    floatingLabelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer,
                                    ),
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
                                        initialDate: DateTime(
                                            DateTime.now().year - 15,
                                            DateTime.now().month,
                                            DateTime.now().day),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(
                                            DateTime.now().year - 15,
                                            DateTime.now().month,
                                            DateTime.now().day),
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
                                  validator: (value) {
                                    //لازم نضيف للشرط نتيجة التشييك على الايدي بالفايربيس
                                    final invDate =
                                        value == null || value.trim().isEmpty;
                                    if (invDate) {
                                      setState(() {
                                        _invalidId = invDate;
                                      });
                                      return 'please enter a valid Date';
                                    }
                                    setState(() {
                                      _invalidDate = invDate;
                                    });
                                    return null;
                                  },
                                ),
                          const SizedBox(
                            height: 12,
                          ),
                          _isLoading
                              ? const CircularProgressIndicator()
                              : Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _submit();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _formKey.currentState!.reset();
                                              _isLogin = !_isLogin;
                                              dateinput.text = ''; // for date
                                              _enteredDate = ''; // for date
                                              _invalidDate = false;
                                              _invalidId = false;
                                              _invalidPassword = false;
                                              _invalidCreds = true;
                                              _userExists = false;
                                              _invalidLoginCreds = false;
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
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error),
                                        ),
                                      ],
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
      ),
    );
  }
}
//581
