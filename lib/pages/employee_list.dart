import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

class EmployeeList extends StatelessWidget {
  EmployeeList({super.key});
  final DatabaseReference databaseReference =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child('employees');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
          stream: databaseReference.onValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData ||
                snapshot.data?.snapshot.value == null) {
              return const Text('No record found');
            } else if (snapshot.hasData &&
                snapshot.data?.snapshot.value != null) {
              Map<dynamic, dynamic> employees =
                  (snapshot.data?.snapshot.value as Map<dynamic, dynamic>);
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                
                child: DataTable(
                  dividerThickness: 2,
                  columns: const [
                    DataColumn(
                        label: Text(
                      'ID',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    DataColumn(
                        label: Text(
                      'Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    DataColumn(
                        label: Text(
                      'Login Time',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                    DataColumn(
                        label: Text(
                      'Logout Time',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                  ],
                  rows: employees.entries.map((entry) {
                    Map<dynamic, dynamic> employee = entry.value;
                    return DataRow(cells: [
                      DataCell(Text(employee['name'])),
                      DataCell(Text(employee['id'])),
                      DataCell(Text(employee['login_time'])),
                      DataCell(Text(employee['logout_time'])),
                    ]);
                  }).toList(),
                  decoration: BoxDecoration(
                    border: Border(
                      right: Divider.createBorderSide(context, width: 2),
                      left: Divider.createBorderSide(context, width: 2),
                      top: Divider.createBorderSide(context, width: 2),
                      bottom: Divider.createBorderSide(context, width: 2),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

 