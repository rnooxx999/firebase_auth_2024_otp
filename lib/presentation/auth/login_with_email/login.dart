import 'package:firebase_auth_2024/featuers/utilites/route.dart';
import 'package:firebase_auth_2024/presentation/auth/login_with_email/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/firebase_auth_logic.dart';
import '../../../domin/shared/components/components.dart';
import '../../../featuers/widgets/outlinebutton.dart';

//Y4azkDPduoOfjDwUBC1KL8sJL483
class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LogInBloc viewModel = LogInBloc();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void initState() {
    viewModel = initViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LogInSuccusfulState) {
            navigateAndFinish(context, routeHomeMainScreen);
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
                OutLineButtonCustomer(
                  backGroundColor: Colors.blueGrey.shade400,
                  text: 'Login' ,
                  onPressed: ()  {
                    viewModel.add(LogInEvent(
                        email: emailController.text,
                        password: passwordController.text
                    ));
                  },
                )

              ],
            ),
          ),
        );
      },
    );
  }

  @override
  LogInBloc initViewModel() {
    return LogInBloc(repo: ServiceAuth());
  }
}
