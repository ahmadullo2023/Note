import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../service/app_localizations.dart';
import '../../../view/auth.dart';
import '../../../view/provider.dart';
import '../../home/home_page.dart';
import '../forgot_password.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey1,
        child: Column(
          children: [
            TextFormField(
              controller: email,
              style: const TextStyle(color: Colors.white),
              validator: (value) =>
                  Provider.of<ProFunc>(context, listen: false).emailUp(value),
              decoration: InputDecoration(
                filled: true,
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: const Color(0xFF5B6262),
                hintText: AppLocalizations.of(context).emailAddress,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: pass,
              validator: (value) => Provider.of<ProFunc>(context, listen: false).passwordUp(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color(0xFF5B6262),
                hintText: AppLocalizations.of(context).password,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  if (_formKey1.currentState!.validate()) {
                    signInWithEmailAndPassword();
                  }
                },
                child: Text(
                  AppLocalizations.of(context).signIn,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext) => ForgotPage(),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context).forgotPassword,
                style: const TextStyle(
                    color: Colors.blueAccent,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> signInWithEmailAndPassword() async {
    await Auth()
        .signInWithEmailAndPassword(
      email: email.value.text,
      password: pass.value.text,
    ).then(
          (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
      ),
    );
  }
}