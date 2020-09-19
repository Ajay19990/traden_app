import 'package:flutter/material.dart';
import 'package:traden_app/utilities/helper_functions.dart';
import 'package:traden_app/widgets/custom_fat_button.dart';
import 'package:traden_app/widgets/custom_textfield.dart';
import 'package:traden_app/widgets/custom_thin_button.dart';
import 'package:traden_app/services/network_helper.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var hideText = true;
  var iconColor = Colors.grey;
  var isLoading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  void bottomSheet() {
    showBottomSheet(
      elevation: 30,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Center(
            child: CustomFatButton(
              title: 'Dismiss 😁',
              onPressed: () => Navigator.pop(context),
            ),
          ),
        );
      },
    );
  }

  void handleLogin() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      await NetworkHelper.login(
        email: emailController.text,
        password: passwordController.text,
        completion: handleResponse,
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  void handleResponse(String responseBody, String error) {
    if (responseBody != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showAlert(context: context, message: error);
    }
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
      body: Builder(
        builder: (context) => Stack(
          children: [
            IgnorePointer(
              ignoring: isLoading,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        hintText: 'EMAIL ADDRESS',
                        iconColor: Colors.white,
                        textFieldController: emailController,
                        validateField: validateEmail,
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        hintText: 'PASSWORD',
                        iconColor: iconColor,
                        hide: hideText,
                        isPasswordTF: true,
                        onPressed: togglePasswordTFStatus,
                        textFieldController: passwordController,
                        validateField: validatePassword,
                      ),
                      SizedBox(height: 20),
                      CustomFatButton(
                        title: 'Login',
                        onPressed: handleLogin,
                      ),
                      SizedBox(height: 10),
                      CustomThinButton(
                        title: 'Forgot Password?',
                        onPressed: bottomSheet,
                      ),
                      SizedBox(height: 10),
                      CustomThinButton(
                        title: 'Not a member yet? Sign up now',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isLoading ? Center(child: CircularProgressIndicator()) : Container(),
          ],
        ),
      ),
    );
  }
}
