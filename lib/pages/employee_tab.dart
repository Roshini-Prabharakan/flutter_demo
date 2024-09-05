import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'employee_form.dart';
import 'employee_list.dart';

class EmployeeTab extends StatefulWidget {
  const EmployeeTab({super.key});

  @override
  State<EmployeeTab> createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  int selectedIndex = 0;
  final List<Widget> screens = [
    const EmployeeForm(),
    EmployeeList(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('Employee Management'),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Employee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Employee List',
          ),
        ],
      ),
    );
  }
}
