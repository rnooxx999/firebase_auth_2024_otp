


import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_2024/domin/shared/components/components.dart';
import 'package:firebase_auth_2024/featuers/utilites/route.dart';
import 'package:flutter/cupertino.dart';

import '../domin/error/erros_handle.dart';

class ServerOTP{
  String? _verificationCode;

  /* ************************ PHONE REGISTER ********************** */

  //LOGIN PHONE :

  // Future<User> withPhoneAuthCredential(PhoneAuthCredential credential) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '+44 7123 123 456',
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int? resendToken) {},
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  //
  // }
  /* ************************ Send Phone Number ********************** */

  Future verifyPhoneNumber(verificationID , context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.verifyPhoneNumber(
      phoneNumber: verificationID,
      verificationCompleted: (PhoneAuthCredential credential) async {

        await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
          final User? user = FirebaseAuth.instance.currentUser;
          final uid = user!.uid;
          await user.updatePhoneNumber(verificationID);
          print("phoneNumber : ${value.user?.phoneNumber}");

          var currentUser = await FirebaseFirestore.instance.collection("users").doc(uid).get();
          if (currentUser.exists) {
            // Todo Have an Account
          } else {
            // Todo First Time
          }
        });

      },
      verificationFailed:  (FirebaseAuthException s ) async {
        _verificationFailed( s  ,context);
      },
      codeSent: (String? verificationID, int? resendToken) async{
        try{
          _codeSent(verificationID , auth , context);
        }catch(e){
          print(e);
        }

      },
      codeAutoRetrievalTimeout: ((String verificationID) {
      }),
      timeout: const Duration(seconds: 60),
    );
  }

  /* ********************* Send Verification Cod  ********************** */

  Future<String?>  submitOtp(otpController) async {

    try {
      final credential = PhoneAuthProvider.credential(verificationId: _verificationCode!,
          smsCode: otpController);
      await FirebaseAuth.instance.signInWithCredential(credential);
      final curentuser = FirebaseAuth.instance.currentUser;
      final snapshot = await FirebaseFirestore.instance.collection("users").doc(curentuser!.uid).get();
      print("curentuser: $curentuser");
      curentuser.uid;

      return curentuser.uid;

    } catch (e) {
      print(e.toString());
    }
  }


  /* ************************ private Method ********************** */


   _codeSent(verificationID ,FirebaseAuth auth ,context)async{
    String smsCode =  '';

    PhoneAuthCredential credential = PhoneAuthProvider
        .credential(verificationId: verificationID!, smsCode: smsCode);
    _verificationCode = verificationID;
    print("verificationID :$verificationID");
    // final signInWithCredential = await auth.signInWithCredential(credential);
    // print("signInWithCredential : $signInWithCredential");
  }


  void _verificationFailed (FirebaseAuthException s ,context) async {
    //TODO verificationFailed
    String result = HandleError.firebaseErrorHandle(s);
    print("verificationFailed : $result");
    navigateToRouteName(context, routePhoneScreen);
    showToast( text: result , state: ToastState.ERROR);

  }
}