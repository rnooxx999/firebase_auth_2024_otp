

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_2024/featuers/utilites/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../data/firebase_auth_logic.dart';

class HomeMainScreen extends StatefulWidget{
  String? uid;
   HomeMainScreen({this.uid});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}
class _HomeMainScreenState extends State<HomeMainScreen> {
  User? user;
String? name , email ;
@override
  void initState() {
  userGet();
    super.initState();
  }

  void userGet()async{
    user = await ServiceAuth().getUser();
    name =user?.displayName;
    email =user?.uid;

    print("user : ${user?.uid}");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      //TODO BLOC GET USER
      backgroundColor: colHaubtBlue,
      body: Center(
        child: Container(
          height: 160,
          child: Column(children: [
            Text("Welcome To Main Page",
            style: Theme.of(context).textTheme.titleSmall,
            )
          ],),
        ),
      ),);
  }
}
//raniaalyazidi@gmail.com