import 'package:flutter/material.dart';
import 'package:note/src/features/auth/widget/sign_in.dart';
import 'package:note/src/features/auth/widget/sign_up.dart';
import 'package:provider/provider.dart';

import '../../../service/app_localizations.dart';
import '../../view/provider.dart';



class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  int index = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final onChanges1 = Provider.of<ProFunc>(context, listen: true).changeIn;
    final onChanges2 = Provider.of<ProFunc>(context, listen: true).changeUp;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).signInTitle,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 35),
                Container(
                  height: 45,
                  width: 209,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF373737),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => onChanges1(index = 0),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == 0
                                ? const Color(0xFF747373)
                                : const Color(0xFF373737),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      GestureDetector(
                        onTap: () => onChanges2(index = 1),
                        child: Container(
                          width: 95,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == 1 ? const Color(0xFF747373) : const Color(0xFF373737),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF), fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 55),
                SizedBox(
                  height: 400,
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      _controller.animateToPage(
                        index,
                        duration: const Duration(microseconds: 400),
                        curve: Curves.ease,
                      );
                    },
                    children: [
                      index == 0 ? const SingIn() : SingUp(),
                    ],
                  ),
                ),
                const Spacer(),
                Image.asset("asset/images/Frame 426.png"),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
