import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:kivaloop/Features/Auth/login_screen.dart';
import 'package:kivaloop/bottom_navbar.dart';
import 'package:kivaloop/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffFCFCFC)),
      home:
          FirebaseAuth.instance.currentUser!.uid == null
              ? LoginScreen()
              : BottomNavbarScreen(),
    );
  }
}
