


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth/auth_main/auth_screen.dart';
import '../auth/auth_main/cubit/user_state.dart';
import '../auth/auth_main/cubit/user_v_m.dart';
import 'home_screen.dart';

class HomeNavigatorBetweenPages extends StatefulWidget {
  const HomeNavigatorBetweenPages({super.key});

  @override
  State<HomeNavigatorBetweenPages> createState() => _HomeNavigatorBetweenPagesState();
}

class _HomeNavigatorBetweenPagesState extends State<HomeNavigatorBetweenPages> {


  @override
  void initState() {
    checkLoginStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return

      FutureBuilder(
          future: Firebase.initializeApp(
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return CircularProgressIndicator();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return
                BlocConsumer<UserViewModel, UserPageState>(
                listener: (context, state) {

                },
                builder: (context, state) {
                  if (state is UserPageINIL) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ),
                      ),
                    );
                  }
                  if (state is ToHomePage) {
                    return HomeMainScreen();
                  }
                  if (state is ToAuthPage) {
                    return AuthPageScreen();
                  }
                  return Container();


                },
              );

            }

            // Otherwise, show something whilst waiting for initialization to complete
            return CircularProgressIndicator();
          });
  }

  void checkLoginStatus()async{
  }

}
