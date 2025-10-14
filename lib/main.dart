import 'package:aplikasi_sewa_lapangan/landing_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sewa Lapangan",
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
