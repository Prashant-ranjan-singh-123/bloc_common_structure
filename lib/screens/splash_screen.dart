import 'package:flutter/material.dart';
import '../reusable/my_scaffold_widget.dart';
import '../services/token_check_service/login_check_screen.dart';
import '../utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void change_page({required BuildContext context}) {
    Future.delayed(const Duration(milliseconds: 3000)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginCheckScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(MyAppAssets.png_image_icon)
            ],
          ),
        ),
      ),
    );
  }
}
