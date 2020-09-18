import 'package:flutter/material.dart';
import 'package:traden_app/widgets/custom_fat_button.dart';
import 'package:traden_app/widgets/custom_textfield.dart';
import 'package:traden_app/widgets/custom_thin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var hideText = true;
  var iconColor = Colors.grey;
  var isLoading = false;

  void togglePasswordTFStatus() {
    setState(() {
      hideText = !hideText;
      if (hideText) {
        iconColor = Colors.grey;
      } else {
        iconColor = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN', style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.indigo[200]),
      ),
      body: Stack(
        children: [
          IgnorePointer(
            ignoring: false,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(hintText: 'EMAIL ADDRESS', iconColor: Colors.white),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'PASSWORD',
                    iconColor: iconColor,
                    hide: hideText,
                    isPasswordTF: true,
                    onPressed: togglePasswordTFStatus,
                  ),
                  SizedBox(height: 20),
                  CustomFatButton(title: 'Login', onPressed: () {}),
                  SizedBox(height: 10),
                  CustomThinButton(title: 'Forgot Password?', onPressed: () {}),
                  SizedBox(height: 10),
                  CustomThinButton(
                      title: 'Not a member yet? Sign up now', onPressed: () {}),
                ],
              ),
            ),
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : Container(),
        ],
      ),
    );
  }
}
