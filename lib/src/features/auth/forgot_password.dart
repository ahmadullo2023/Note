import 'package:flutter/material.dart';
import 'package:note_app/src/features/auth/set_password.dart';
import 'package:provider/provider.dart';
import '../../../service/app_localizations.dart';
import '../../view/provider.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _formKey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey3,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).forgotpassword,
                  style: const TextStyle(fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  validator: (value) =>
                      Provider.of<ProFunc>(context, listen: false).emailUp(value/*, box*/),
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Color(0xFF5B6262),
                    hintText: AppLocalizations.of(context).emailAddress,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF36BFFA),
                    ),
                    onPressed: (){
                      if (_formKey3.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const SetPassword(),
                          ),
                        );
                      }
                    },
                    child: Text(AppLocalizations.of(context).next),
                  ),
                ),
                const SizedBox(height: 40,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
