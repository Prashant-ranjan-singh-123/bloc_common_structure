import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void change_page({required BuildContext context}) {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => SizedBox()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
