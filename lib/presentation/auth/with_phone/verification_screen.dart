import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dart:async';

import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../../data/firebase_otp.dart';
import 'bloc/phone_bloc.dart';

class Verificatoin extends StatefulWidget {
  PhoneBloc viewModel ;
   Verificatoin(this.viewModel);

  @override
  _VerificatoinState createState() => _VerificatoinState();
}

class _VerificatoinState extends State<Verificatoin> {

  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;
//  late PhoneBloc viewModel ;

  String _code = '';

  late Timer _timer;
  late Timer _timerImage;

  int _start = 60;
  int _currentIndex = 0;

  void resend() {
    if (!mounted) return;
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 2000);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  void initState() {
    //viewModel = initViewModel();
    timerPerInit();
    super.initState();
  }


  void timerPerInit(){
    _timerImage = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex++;

        if (_currentIndex == 3)
          _currentIndex = 0;
      });
    });

  }
  @override
  void dispose() {
    _timerImage?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<PhoneBloc, PhoneState>(
  listener: (context, state) {


    // TODO: implement listener
  },
  builder: (context, state) {
    return SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: AnimatedOpacity(
                              opacity: _currentIndex == 0 ? 1 : 0,
                              duration: Duration(seconds: 1,),
                              curve: Curves.linear,
                              child: Image.network('https://ouch-cdn2.icons8.com/eza3-Rq5rqbcGs4EkHTolm43ZXQPGH_R4GugNLGJzuo/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNjk3/L2YzMDAzMWUzLTcz/MjYtNDg0ZS05MzA3/LTNkYmQ0ZGQ0ODhj/MS5zdmc.png',),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: AnimatedOpacity(
                              opacity: _currentIndex == 1 ? 1 : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.linear,
                              child: Image.network('https://ouch-cdn2.icons8.com/pi1hTsTcrgVklEBNOJe2TLKO2LhU6OlMoub6FCRCQ5M/rs:fit:784:666/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzAv/MzA3NzBlMGUtZTgx/YS00MTZkLWI0ZTYt/NDU1MWEzNjk4MTlh/LnN2Zw.png',),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: AnimatedOpacity(
                              opacity: _currentIndex == 2 ? 1 : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.linear,
                              child: Image.network('https://ouch-cdn2.icons8.com/ElwUPINwMmnzk4s2_9O31AWJhH-eRHnP9z8rHUSS5JQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNzkw/Lzg2NDVlNDllLTcx/ZDItNDM1NC04YjM5/LWI0MjZkZWI4M2Zk/MS5zdmc.png',),
                            ),
                          )
                        ]
                    ),
                  ),
                  SizedBox(height: 30,),
                  FadeInDown(
                      duration: Duration(milliseconds: 500),
                      child: Text("Verification", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 30,),
                  FadeInDown(
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 500),
                    child: Text("Please enter the 4 digit code sent to \n +93 706-399-999",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade500, height: 1.5),),
                  ),
                  SizedBox(height: 30,),

                  // Verification Code Input
                  FadeInDown(
                    delay: Duration(milliseconds: 600),
                    duration: Duration(milliseconds: 500),
                    child:
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                        print(code);
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode){
                        showDialog(
                            context: context,
                            builder: (context){
                              return Center(
                                child:
                                    AlertDialog(
                                      title: Text("Verification Code"),
                                      content:
                                      SizedBox(
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [Text('Code entered is $verificationCode'),

                                    CircularProgressIndicator()
                                  ],),
                                      ),
                                ),
                              );
                            }
                        );
                            setState(() {
                             widget.viewModel.add(VerificationOTPEvent(
                                 otpSMS: verificationCode, context:context));

                           //   widget.viewModel.verificationCodeSMSSink.add(verificationCode);
                              _code = verificationCode;
                            });
                      }, // end onSubmit
                    ),
                    // VerificationCode(
                    //   length: 4,
                    //   textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    //   underlineColor: Colors.black,
                    //   keyboardType: TextInputType.number,
                    //   underlineUnfocusedColor: Colors.black,
                    //   onCompleted: (value) {
                    //     setState(() {
                    //       _code = value;
                    //     });
                    //   },
                    //   onEditing: (value) {},
                    // ),
                  ),


                  SizedBox(height: 20,),
                  FadeInDown(
                    delay: Duration(milliseconds: 700),
                    duration: Duration(milliseconds: 500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't resive the OTP?", style: TextStyle(fontSize: 14, color: Colors.grey.shade500),),
                        TextButton(
                            onPressed: () {
                              if (_isResendAgain) return;
                              resend();
                            },
                            child: Text(_isResendAgain ? "Try again in " + _start.toString() : "Resend", style: TextStyle(color: Colors.blueAccent),)
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  FadeInDown(
                    delay: Duration(milliseconds: 800),
                    duration: Duration(milliseconds: 500),
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: _code.length < 4 ? () => {} : () { verify(); },
                      color: Colors.orange.shade400,
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: _isLoading ? Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 3,
                          color: Colors.black,
                        ),
                      ) : _isVerified ? Icon(Icons.check_circle, color: Colors.white, size: 30,) : Text("Verify", style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],)
          ),
        );
  },
)
    );
  }
  @override
  PhoneBloc initViewModel() {
    return PhoneBloc(repo: ServerOTP());
  }
}