import 'package:flutter/material.dart';
import 'package:gp/screens/book%20Appointment/selectDoctor.dart';

class SpecialityCard extends StatelessWidget {
  final String speciality;

//image or icon
  const SpecialityCard({super.key, required this.speciality});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const SelectDoctorScreen(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        color: Theme.of(context).colorScheme.background,
        child: Container(
          // width: 349,
          // height: 154,
          padding:
              const EdgeInsets.only(left: 0, right: 16, top: 6, bottom: 12),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Icon(
                      Icons.health_and_safety,
                      size: 45,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        Text(
                          speciality,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
