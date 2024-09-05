import 'package:employeeapp/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyCwoE-6qeF25Me_MTgLWS_4gHRhe7Bw2Jc',
        appId: '1:182552086703:android:e12c88e1608947b6a7ac5a',
        messagingSenderId: '182552086703',
        projectId: 'employeeapp-b7479',
        databaseURL: 'https://employeeapp-b7479-default-rtdb.firebaseio.com/'),
  );
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
