import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../service/app_localizations.dart';
import '../../../view/auth.dart';
import '../../../view/provider.dart';
import '../../home/home_page.dart';
//late Box box;

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);
  @override
  State<SingUp> createState() => _SingUpState();
}
class _SingUpState extends State<SingUp> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final _formKey2 = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    Provider.of<ProFunc>(context, listen: false).createBox(email, pass);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey2,
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(color: Colors.white),
              validator: (value) {
                return Provider.of<ProFunc>(context, listen: false).nameUp(value);
              },
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color(0xFF5B6262),
                hintText: AppLocalizations.of(context).fullName,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: email,
              validator: (value) => Provider.of<ProFunc>(context, listen: false).emailUp(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color(0xFF5B6262),
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
              style: TextStyle(color: Colors.white),
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
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  if (_formKey2.currentState!.validate()) {
                    Provider.of<ProFunc>(context, listen: false).login(email, pass);
                    createUserWithEmailAndPassword();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext) => HomePage(),
                      ),
                    );
                  }
                },
                child: Text(
                  AppLocalizations.of(context).signUp,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> createUserWithEmailAndPassword() async {
    await Auth().createUserWithEmailAndPassword(
      email: email.value.text,
      password: pass.value.text,
    );
  }
}
