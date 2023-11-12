import 'package:flutter/material.dart';
import 'package:gp/screens/book%20Appointment/summary.dart';
import 'package:gp/widgets/doctorCardNoTap.dart';
import 'package:intl/intl.dart';

class Schedulescreen extends StatefulWidget {
  const Schedulescreen({super.key});

  @override
  State<Schedulescreen> createState() => _SchedulescreenState();
}

class _SchedulescreenState extends State<Schedulescreen> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field (for date)
    super.initState();
  }

  var _enteredDate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Select date and time')),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
        child: Column(
          children: [
            DoctorCardNoTap(doctorName: 'doctorName', speciality: 'speciality'),
            SizedBox(
              height: 25,
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: const EdgeInsets.only(left: 20),
            //   child: Text(
            //     'Date :',
            //     textAlign: TextAlign.left,
            //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //           color: Theme.of(context).colorScheme.onPrimary,
            //         ),
            //   ),
            // ),
            // Container(
            //   alignment: Alignment.center,
            //   margin: const EdgeInsets.only(left: 10),
            //   child: Row(
            //     children: [
            //       // Text(
            //       //   'Date :',
            //       //   textAlign: TextAlign.left,
            //       //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //       //         color: Theme.of(context).colorScheme.onPrimary,
            //       //       ),
            //       // ),
            //       // IconButton(
            //       //   onPressed: () {
            //       //     showDatePicker(
            //       //         context: context,
            //       //         initialDate: DateTime.now(),
            //       //         firstDate: DateTime.now(),
            //       //         lastDate: DateTime(DateTime.now().year,
            //       //             DateTime.now().month, DateTime.now().day + 14),
            //       //         builder: (context, child) {
            //       //           return Theme(
            //       //             data: Theme.of(context).copyWith(
            //       //               colorScheme: ColorScheme.dark(
            //       //                 primary: Theme.of(context)
            //       //                     .colorScheme
            //       //                     .secondaryContainer, // header background color
            //       //                 onPrimary: Colors.black, // header text color
            //       //                 onSurface: Theme.of(context)
            //       //                     .colorScheme
            //       //                     .onPrimary, // body text color
            //       //               ),
            //       //               textButtonTheme: TextButtonThemeData(
            //       //                 style: TextButton.styleFrom(
            //       //                   backgroundColor:
            //       //                       Theme.of(context).colorScheme.primary,
            //       //                   foregroundColor:
            //       //                       Theme.of(context).colorScheme.onPrimary,
            //       //                 ),
            //       //               ),
            //       //             ),
            //       //             child: child!,
            //       //           );
            //       //         });
            //       //   },
            //       //   icon: Icon(
            //       //     Icons.date_range,
            //       //     size: 55,
            //       //     color: Theme.of(context).colorScheme.onPrimary,
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
            TextFormField(
              // date for sign up
              controller: dateinput, //editing controller of this TextField
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
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                label: const Text('Date'),
                floatingLabelStyle: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),

              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day + 14),
                    // edit colors of date picker here --------
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.dark(
                            primary: Theme.of(context)
                                .colorScheme
                                .secondaryContainer, // header background color
                            onPrimary: Colors.black, // header text color
                            onSurface: Theme.of(context)
                                .colorScheme
                                .onPrimary, // body text color
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    });

                if (pickedDate != null) {
                  //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
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
              height: 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 6),
              child: Text(
                'available time:',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '10-11',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '10-11',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '10-11',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const SummaryScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: Text(
                      'Next',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
