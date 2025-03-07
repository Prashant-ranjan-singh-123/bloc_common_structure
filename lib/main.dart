import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/splash_screen.dart';
import 'services/token_check_service/login_check_cubit.dart';
import 'utils/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
            providers: [BlocProvider(create: (context) => LoginCheckCubit())],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(scaffoldBackgroundColor: MyAppColor.background),
              home: const SplashScreen(),
            ));
      },
    );
  }
}
