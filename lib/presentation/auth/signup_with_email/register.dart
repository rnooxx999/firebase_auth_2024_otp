import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/firebase_auth_logic.dart';
import '../../../domin/shared/components/components.dart';
import '../../../domin/shared/network/local/cache_helper.dart';
import '../../../featuers/utilites/route.dart';
import '../../../featuers/widgets/outlinebutton.dart';
import 'bloc/sign_up_bloc.dart';

class SignupForm extends StatefulWidget {
  SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  SignUpBloc viewModel = SignUpBloc();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void initState() {
    viewModel = initViewModel();
    printt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is SignUpSuccusfulState) {
     //     CacheHelper.SaveData(key: 'uID', value: state.uId).then((value) {
            navigateAndFinish(context, routeHomeMainScreen);
       //   });
        } else {}
        },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Form(
            key: viewModel.formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                OutLineButtonCustomer(
                  backGroundColor: Colors.blueGrey.shade400,
                  text: 'Signup' ,
                  onPressed: () async {
                    viewModel.add(SignUpEvent(
                        email: emailController.text,
                        password: passwordController.text
                    ));
                  },
                )

                    // await ServiceAuth().signUp(
                    //    email: "ran@gmail.com",
                    //    password: "123456789"
                    //  );


              ],
            ),
          ),
        );
      },
    );
  }

  void printt() async {
    final sharedPref = await SharedPreferences.getInstance();
    String? lollol = await CacheHelper.GetData(key: 'uID');
    print("Are You Here ? $lollol");
  }

  @override
  SignUpBloc initViewModel() {
    return SignUpBloc(repo: ServiceAuth());
  }
}