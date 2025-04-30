// import 'package:design_app/scr/challenges/square_animate_page.dart';
// import 'package:design_app/scr/pages/circular_progress_page.dart';
// import 'package:design_app/scr/pages/graphics_circle_page.dart';
// import 'package:design_app/scr/labs/slideshow_page.dart';
// import 'package:design_app/scr/pages/animations_page.dart';
// import 'package:design_app/scr/pages/headers_page.dart';
import 'package:design_app/scr/pages/pinteres_page.dart';
// import 'package:design_app/scr/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: PinteresPage()
    );
  }
}

