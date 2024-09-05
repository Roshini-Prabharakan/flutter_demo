import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key});
  @override
  EmployeeFormState createState() => EmployeeFormState();
}

class EmployeeFormState extends State<EmployeeForm> {
  // ignore: deprecated_member_use
  final databaseReference = FirebaseDatabase.instance.ref().child('employees');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _loginTimeController = TextEditingController();
  final TextEditingController _logoutTimeController = TextEditingController();

  void _submitForm() {
    String name = _nameController.text;
    String id = _idController.text;
    String loginTime = _loginTimeController.text;
    String logoutTime = _logoutTimeController.text;

    // Save data to Firebase
    databaseReference.push().set({
      'name': name,
      'id': id,
      'login_time': loginTime,
      'logout_time': logoutTime,
    });

    // Clear text fields after submission
    _nameController.clear();
    _idController.clear();
    _loginTimeController.clear();
    _logoutTimeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: _idController,
              hintText: 'ID',
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: _nameController,
              hintText: 'Name',
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: _loginTimeController,
              hintText: 'Login Time',
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: _logoutTimeController,
              hintText: 'Logout Time',
              obscureText: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              style:
                  ElevatedButton.styleFrom(foregroundColor: Colors.grey[300]),
              child: const Text('Add Employee'),
            ),
          ],
        ),
      ),
    );
  }
}
