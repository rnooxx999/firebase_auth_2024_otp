/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */

import 'package:firebase_auth_2024/domin/shared/components/components.dart';
import 'package:firebase_auth_2024/presentation/auth/auth_main/switcher_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../data/firebase_auth_logic.dart';
import '../../../featuers/utilites/route.dart';
import '../../../featuers/widgets/outlinebutton.dart';

class AuthPageScreen extends StatefulWidget {
  static const String path = "lib/src/pages/login/auth3.dart";

  const AuthPageScreen({super.key});

  @override
  _AuthPageScreenState createState() => _AuthPageScreenState();
}

class _AuthPageScreenState extends State<AuthPageScreen> {
  late bool formVisible;
  int? _formsIndex;
 ServiceAuth serviceAuth = ServiceAuth();
  @override
  void initState() {
    //serviceAuth.getUser();
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
         //  color: Colors.purple

          ),
          child: Stack(
            children: <Widget>[
              Container(
                //color: Colors.black54,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: kToolbarHeight + 40),
                    Expanded(
                      child: Column(
                        children:  <Widget>[
                          Text(
                            "Welcome",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "Welcome to this awesome login app. \n You are awesome",
                            style: Theme.of(context).textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "هنا نستعرض عدة طرق تسجيل دخول المستخدم. \n في الفايربيس",
                            style: Theme.of(context).textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 10.0),
                        Expanded(
                          child:
                          OutLineButtonCustomer(
                            backGroundColor: Colors.blueGrey.shade300,
                            text: "Log In",
                            iconData: Icons.email,
                            onPressed: (){
                                setState(() {
                                  formVisible = true;
                                  _formsIndex = 1;
                                });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child:
                          OutLineButtonCustomer(
                            backGroundColor: Colors.blueGrey,
                            text: "Sign Up",
                            iconData: Icons.email,
                            onPressed: (){
                              setState(() {
                                formVisible = true;
                                _formsIndex = 2;
                              });
                              },
                          ),

                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(children: [
                          OutLineButtonCustomer(
                            backGroundColor: Colors.black26,
                            text: "Continue with Phone",
                            iconData: Icons.phone,
                            onPressed: (){
                              navigateAndFinish(context,routeRegisterPhoneScreen );
                            },
                          ),
                          const SizedBox(width: 30.0),

                          OutLineButtonCustomer(
                            backGroundColor: Colors.red,
                            text: "Continue with Google",
                            iconData: FontAwesomeIcons.google,
                            onPressed: (){},
                          ),
                          const SizedBox(width: 30.0),

                          OutLineButtonCustomer(
                            backGroundColor: Colors.blueAccent,
                            text: "Continue with Facebook",
                            iconData: FontAwesomeIcons.facebook,
                            onPressed: (){},
                          ),

                        ],),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              SwitcherLoginResisterScreen(
                formsIndex: _formsIndex ?? 0,
                formVisible: formVisible,
              ),
            ],
          ),
        ));
  }
}
