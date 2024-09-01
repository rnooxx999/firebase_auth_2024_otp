import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth_2024/domin/shared/components/components.dart';
import 'package:firebase_auth_2024/domin/shared/network/local/cache_helper.dart';
import 'package:firebase_auth_2024/featuers/utilites/route.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../data/firebase_otp.dart';
import '../../../../featuers/utilites/enum.dart';

part 'phone_event.dart';
part 'phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  StreamController<String> verificationCodeSMS = StreamController<String>.broadcast();
  Stream<String> get verificationCodeSMSStream => verificationCodeSMS.stream;
  Sink<String> get verificationCodeSMSSink => verificationCodeSMS.sink;

  ServerOTP? repo;

  PhoneBloc({this.repo}) : super(PhoneState()) {
    on<PhoneSendNumberEvent>(sendNumberToVerification);
    on<VerificationOTPEvent>(sendSmsOtpVerification);

  }

  void sendNumberToVerification(
      PhoneSendNumberEvent event ,
      Emitter<PhoneState> emit
      )async{

    try{
      print("phoneNumber :${event.phoneNumber} ");
      print("verificationCodeSMSStream :${verificationCodeSMSStream} ");

      var lol = await repo?.verifyPhoneNumber(
          event.phoneNumber,
              event.context
      );
      emit(PhoneGoToVerivState());

      // emit(PhoneNumberState(status: StatusGeneralEnum.successful,));

      print("lol event: ${await lol}");
  }catch(error){
      print("object");
      }
 }

  void sendSmsOtpVerification(
      VerificationOTPEvent event ,
      Emitter<PhoneState> emit
      )async{
    String?  useResult = '';

    try{
      useResult = await repo?.submitOtp(
          event.otpSMS
      );
    if(useResult != ''){
      CacheHelper.SaveData(key: 'uID', value: useResult);
      navigateToRouteName(event.context, routeHomeMainScreen , arguments:useResult );
    }

    }catch(error){
     // emit(OtpState(status: StatusGeneralEnum.failure));
    }
  }

}