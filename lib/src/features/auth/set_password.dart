import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../service/app_localizations.dart';
import '../../view/provider.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final _formKey4 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey4,
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).forgotpassword,
                  style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  validator: (value) =>
                      Provider.of<ProFunc>(context, listen: false).emailUp(value),
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
                SizedBox(height: 30),
                TextFormField(
                  validator: (value) => Provider.of<ProFunc>(context, listen: false)
                      .passwordUp(value),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Color(0xFF5B6262),
                    hintText: AppLocalizations.of(context).newpassword,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  validator: (value) => Provider.of<ProFunc>(context, listen: false)
                      .passwordUp(value/*, box*/),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Color(0xFF5B6262),
                    hintText: AppLocalizations.of(context).newpassword,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Spacer(),
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
                      if (_formKey4.currentState!.validate()) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) =>,
                        //   ),
                        // );
                      }
                    },
                    child: Text(AppLocalizations.of(context).next),
                  ),
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
