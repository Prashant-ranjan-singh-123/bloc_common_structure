import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../reusable/my_scaffold_widget.dart';
import '../../../reusable/text_buttons/MyAppElevatedButton.dart';
import '../../../reusable/text_fields/text_field_with_head.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Scaffold(
        backgroundColor: MyAppColor.background,
        appBar: AppBar(
          backgroundColor: MyAppColor.brand_color,
          centerTitle: true,
          title: Text(
            'Login',
            style: TextStyle(
                color: MyAppColor.background,
                fontWeight: FontWeight.w700,
                fontSize: 8.sp),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            reverse: true,
            dragStartBehavior: DragStartBehavior.down,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Lottie.asset(MyAppAssets.lottie_login_page_animation),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: TextFieldWithHead(
                    heading: 'Email',
                    hintText: 'Enter Emails',
                    controller: _email,
                    show_suffix: false,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: TextFieldWithHead(
                    heading: 'Password',
                    hintText: '**********',
                    controller: _email,
                    show_suffix: false,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Myappelevatedbutton(
                      isExpanded: true,
                      text: 'Login',
                      buttonColor: MyAppColor.brand_color,
                      onPress: () {}),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
