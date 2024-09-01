

import 'package:firebase_auth_2024/presentation/auth/signup_with_email/register.dart';
import 'package:flutter/material.dart';

import '../login_with_email/login.dart';

class SwitcherLoginResisterScreen extends StatefulWidget {
  int formsIndex;
  bool formVisible;
   SwitcherLoginResisterScreen({
     required this.formsIndex,
     required this.formVisible

   });

  @override
  State<SwitcherLoginResisterScreen> createState() => _SwitcherLoginResisterScreenState();
}

class _SwitcherLoginResisterScreenState extends State<SwitcherLoginResisterScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: (!widget.formVisible)
          ? null
          : Container(
        color: Colors.black54,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: widget.formsIndex == 1
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: widget.formsIndex == 1
                        ? Colors.blueGrey.shade300
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  child: const Text("Log in"),
                  onPressed: () {
                    setState(() {
                      widget.formsIndex = 1;
                    });
                  },
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: widget.formsIndex == 2
                        ? Colors.white
                        : Colors.black,
                    backgroundColor: widget.formsIndex == 2
                        ? Colors.blueGrey.shade300
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  child: const Text("Signup"),
                  onPressed: () {
                    setState(() {
                      widget.formsIndex = 2;
                    });
                  },
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      widget.formVisible = false;
                    });
                  },
                )
              ],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child:
              widget.formsIndex == 1 ?  LoginForm() :  SignupForm(),
            )
          ],
        ),
      ),
    );
  }
}
