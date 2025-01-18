import 'package:finance_guru/controllers/controller_screen.dart';
import 'package:finance_guru/screens/pre_dashboard_screens/entry_screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final AndroidOptions androidOptions = const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  bool? isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final loginStatus = await storage.read(key: 'login', aOptions: androidOptions);
    setState(() {
      isLoggedIn = loginStatus == 'true';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      // Show a loading indicator while checking the login status
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return MaterialApp(
      title: 'Finance Guru',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[100]),
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn! ? const ControllerScreen() : const WelcomeScreen(),
    );
  }
}