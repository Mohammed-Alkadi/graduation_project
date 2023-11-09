import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp/widgets/doctorCard.dart';

class SelectDoctorScreen extends StatefulWidget {
  const SelectDoctorScreen({super.key});

  @override
  State<SelectDoctorScreen> createState() => _SelectDoctorScreenState();
}

class _SelectDoctorScreenState extends State<SelectDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        TextEditingController().clear();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select a Doctor'),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
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
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  label: const Text('Search'),
                  floatingLabelStyle: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  prefixIcon: const Icon(Icons.search)),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              autocorrect: true,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(25),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                    DoctorCard(
                        doctorName: 'doctorName', speciality: 'speciality'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
