import 'package:flutter/material.dart';
import 'package:gp/screens/appointment.dart';
import 'package:gp/screens/homepage.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget homepageTitle = Row(
      children: [
        const Icon(
          Icons.person,
          size: 50,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              'khaled Ahmed \n 123323111',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary, // user info from firebase
                  ),
            ),
          ],
        ),
      ],
    );

    Widget _chatTitle = const Text('Messages');

    Widget _appointmentTitle = const Text('My Appointments');

    Widget _medFileTitle = const Text('My Health');

    Widget _profileTitle = const Text('Profile');

    Widget activePage = const HomepageScreen();
    var activePageTitle = homepageTitle;

    // if (_selectedPageIndex == 1) {
    //   activePage = const ChatScreen();
    //   activePageTitle = _chatTitle;
    // }

    if (_selectedPageIndex == 2) {
      activePage = const AppointmentScreen();
      activePageTitle = _appointmentTitle;
    }

    // if (_selectedPageIndex == 3) {
    //   activePage = const MedFileScreen();
    //   activePageTitle = _medFileTitle;
    // }

    // if (_selectedPageIndex == 4) {
    //   activePage = const ProfileScreen();
    //   activePageTitle = _profileTitle;
    // }

    return Scaffold(
      appBar: AppBar(
        title:
            activePageTitle, //const Text('Health Bridge'), //Text(activePageTitle),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        fixedColor: Theme.of(context).colorScheme.onSecondary,
        unselectedItemColor: Theme.of(context).colorScheme.onSecondaryContainer,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined), label: 'Chat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: 'Med File'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Profile'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
