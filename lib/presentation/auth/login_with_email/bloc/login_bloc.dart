import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../data/firebase_auth_logic.dart';
import '../../../../domin/error/error_toast.dart';
import '../../../../domin/error/erros_handle.dart';
import '../../../../domin/shared/components/components.dart';
import '../../../../domin/shared/network/local/cache_helper.dart';
import '../../../../featuers/utilites/enum.dart';
part 'login_event.dart';
part 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  ServiceAuth? repo;
  final formKey = GlobalKey<FormState>();

  LogInBloc({ this.repo}) : super(LogInState()) {
    on<LogInEvent>((event, emit) async {

      if (!formKey.currentState!.validate()) return;

      try {
        formKey.currentState!.save();
        await repo?.signInWithEmailAndPassword(
          email: event.email ?? '',
          password: event.password ?? '',
        ).then((value) {
          if (value != null) {
             CacheHelper.SaveData(key: 'uID', value: value.uid);
            emit(LogInSuccusfulState(value.uid));
            showToast(text: 'SUCCESS Log IN ${value.email}', state: ToastState.SUCCESS);

          } else {
            // التعامل مع حالة عدم نجاح عملية الإنشاء
            throw Exception('Registration failed. Check error logs.');
          }

        }).catchError((onError){
          // عندما يكون الخطأ من فايربيس
          String firebaseErrorText =  HandleError.firebaseErrorHandle(onError);
          showToast(text: firebaseErrorText,
              state: ToastState.ERROR);
          print(onError.toString());
        });
        emit(state.copyWith(status: StatusGeneralEnum.successful));
      } on
      FirebaseAuthException catch(e){
        String firebaseErrorText =  HandleError.firebaseErrorHandle(e);
        showToast(text: firebaseErrorText,
            state: ToastState.ERROR);


      }
      on Exception catch (error) {
        emit(LogInState(
            exception: error, status: StatusGeneralEnum.failure));
      }
    });
  }
}
