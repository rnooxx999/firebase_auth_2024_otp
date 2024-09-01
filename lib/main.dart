import 'package:firebase_auth_2024/presentation/auth/auth_main/cubit/user_v_m.dart';
import 'package:firebase_auth_2024/presentation/auth/login_with_email/bloc/login_bloc.dart';
import 'package:firebase_auth_2024/presentation/auth/with_phone/bloc/phone_bloc.dart';
import 'package:firebase_auth_2024/presentation/auth/with_phone/verification_screen.dart';
import 'package:firebase_auth_2024/presentation/auth/with_phone/with_phone_number_screen.dart';
import 'package:firebase_auth_2024/presentation/auth/signup_with_email/bloc/sign_up_bloc.dart';
import 'package:firebase_auth_2024/presentation/home/home_navigator.dart';
import 'package:firebase_auth_2024/presentation/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domin/shared/components/constants.dart';
import 'domin/shared/network/local/cache_helper.dart';
import 'featuers/utilites/route.dart';
import 'featuers/utilites/styles/Themes.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();

  print("uID : $uID");

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<UserViewModel>(
                create: (context) => UserViewModel()
                  ..userCurrentStatus()
            ),
            BlocProvider<SignUpBloc>(
                create: (context) => SignUpBloc()
            ),
            BlocProvider<LogInBloc>(
                create: (context) => LogInBloc()
            ),
            BlocProvider<PhoneBloc>(
                create: (context) => PhoneBloc()
            ),
          ],
          child:
          MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: routeHomeNAvigatorScreen,

      theme: MyTheme.lightThemData,



      routes: {
        routeRegisterPhoneScreen: (context) => RegisterWithPhoneNumber(),
        routeHomeMainScreen :(context)=> HomeMainScreen(),
        routeHomeNAvigatorScreen: (context) => HomeNavigatorBetweenPages(),
        //routeVerificatoinScreen :(context)=> Verificatoin(),
        routePhoneScreen :(context)=> RegisterWithPhoneNumber(),

      },
    );

  }
}

