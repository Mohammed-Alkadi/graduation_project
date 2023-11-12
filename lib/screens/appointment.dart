import 'package:flutter/material.dart';
import 'package:gp/screens/book%20Appointment/selectSpeciality.dart';
import 'package:gp/widgets/appointmentcard.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  bool _isUpcoming = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.background,
            ),
            margin: const EdgeInsets.fromLTRB(16, 16, 200, 16),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
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
                    backgroundColor: _isUpcoming
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    setState(() {
                      _isUpcoming = true;
                    });
                  },
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  style: TextButton.styleFrom(
                    shadowColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: !_isUpcoming
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    setState(() {
                      _isUpcoming = false;
                    });
                  },
                  child: Text(
                    'History',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppointmentCard(
                      doctorName: 'NameTest',
                      specialty: 'SpecialtyTest',
                      appointmentStatus: 'appointmentStatus',
                      appointmentDateTime: 'appointmentDateTime'),
                  AppointmentCard(
                      doctorName: 'NameTest',
                      specialty: 'SpecialtyTest',
                      appointmentStatus: 'appointmentStatus',
                      appointmentDateTime: 'appointmentDateTime'),
                  AppointmentCard(
                      doctorName: 'NameTest',
                      specialty: 'SpecialtyTest',
                      appointmentStatus: 'appointmentStatus',
                      appointmentDateTime: 'appointmentDateTime'),
                  AppointmentCard(
                      doctorName: 'NameTest',
                      specialty: 'SpecialtyTest',
                      appointmentStatus: 'appointmentStatus',
                      appointmentDateTime: 'appointmentDateTime'),
                ],
              ),
            ),
          ),
          // ListView(
          //   children: [
          //     AppointmentCard(
          //         doctorName: 'NameTest',
          //         specialty: 'SpecialtyTest',
          //         appointmentStatus: 'appointmentStatus',
          //         appointmentDateTime: 'appointmentDateTime'),
          //   ],
          // ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const SelectSpecialityScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                ),
                child: Text(
                  'Book Appointment',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
