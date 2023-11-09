import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String appointmentStatus;
  final String appointmentDateTime;

  AppointmentCard({
    required this.doctorName,
    required this.specialty,
    required this.appointmentStatus,
    required this.appointmentDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(),
      color: Theme.of(context).colorScheme.secondary,
      child: Container(
        // width: 349,
        // height: 147,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
