import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp/widgets/specialityCard.dart';

class SelectSpecialityScreen extends StatefulWidget {
  const SelectSpecialityScreen({super.key});

  @override
  State<SelectSpecialityScreen> createState() => _SelectSpecialityScreenState();
}

class _SelectSpecialityScreenState extends State<SelectSpecialityScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        TextEditingController().clear();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select a Speciality'),
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
                    SpecialityCard(
                        speciality:
                            'test'), // speciality from firebase or hard coded
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                    SpecialityCard(speciality: 'test'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
