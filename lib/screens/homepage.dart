import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp/models/patients.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userEmail;
    final _currentUser = FirebaseAuth.instance.currentUser;
    if (_currentUser != null) {
      userEmail = _currentUser.email.toString();
    }

    return Text(userEmail);
  }
}
