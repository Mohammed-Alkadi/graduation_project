import 'package:flutter/material.dart';

class DoctorCardNoTap extends StatelessWidget {
  final String doctorName;
  final String speciality;

//image or icon
  const DoctorCardNoTap(
      {super.key, required this.doctorName, required this.speciality});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Theme.of(context).colorScheme.secondary,
      child: Container(
        // width: 349,
        // height: 154,
        padding: const EdgeInsets.only(left: 0, right: 16, top: 6, bottom: 12),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 45,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Text(
                        doctorName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
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
    );
  }
}
