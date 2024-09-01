import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../data/firebase_auth_logic.dart';
import '../../../../domin/error/erros_handle.dart';
import '../../../../domin/shared/components/components.dart';
import '../../../../domin/shared/network/local/cache_helper.dart';
import '../../../../domin/error/error_toast.dart';
import '../../../../featuers/utilites/enum.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  ServiceAuth? repo;
  final formKey = GlobalKey<FormState>();

  SignUpBloc({ this.repo}) : super(SignUpState()) {
    on<SignUpEvent>((event, emit) async {

      if (!formKey.currentState!.validate()) return;

      //

      try {
        formKey.currentState!.save();

       await repo?.createUserWithAdditionalInfo(
          email: event.email ?? '',
          password: event.password ?? '',
          phoneNumber: "",
          age: 28,
        ).then((value) {
          if (value != null) {
            CacheHelper.SaveData(key: 'uID', value: value.uid);
            emit(SignUpSuccusfulState(value.uid));
            showToast(text: 'SUCCESS Sign Up ${value.email}', state: ToastState.SUCCESS);

          } else {
            // التعامل مع حالة عدم نجاح عملية الإنشاء
            throw Exception('Registration failed. Check error logs.');
          }
        }) .catchError((onError){
          // عندما يكون الخطأ من فايربيس
          showToast(text: '${extractErrorMessage(onError.toString())}',
              state: ToastState.ERROR);
          print(onError.toString());
        });

        // Check if credential is null (meaning registration failed)
        // if (credential == null) {
        //
        //   throw Exception('Registration failed. Check error logs.');
        // }



        //final token = await credential?.getIdToken();

      }on
      FirebaseAuthException catch(e){
        String firebaseErrorText =  HandleError.firebaseErrorHandle(e);
        showToast(text: firebaseErrorText,
            state: ToastState.ERROR);


      }
      on Exception catch (error) {
        print("SignUpBloc error : $error");
        // emit(SignUpState(
        //     exception: error, status: StatusGeneralEnum.failure));
      }
    });
  }
}
