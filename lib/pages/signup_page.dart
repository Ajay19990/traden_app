import 'package:flutter/material.dart';
import 'package:traden_app/widgets/custom_check_box.dart';
import 'package:traden_app/widgets/custom_fat_button.dart';
import 'package:traden_app/widgets/custom_textfield.dart';
import 'package:traden_app/utilities/helper_functions.dart';
import 'package:traden_app/widgets/custom_thin_button.dart';
import 'package:traden_app/services/network_helper.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var hideText = true;
  var iconColor = Colors.grey;
  var isSelected = false;
  var isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

  void handleSignUpResponse(String responseBody, String error) async {
    await NetworkHelper.login(
      email: emailController.text,
      password: passwordController.text,
      completion: handleLoginResponse,
    );
  }

  void handleLoginResponse(String responseBody, String error) async {
    if (responseBody != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showAlert(context: context, message: error);
    }
  }

  void handleSignUp() async {
    if (_formKey.currentState.validate() && isSelected) {
      setState(() {
        isLoading = true;
      });
      await NetworkHelper.signUp(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        completion: handleSignUpResponse,
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP', style: Theme.of(context).textTheme.headline6),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.indigo[200]),
      ),
      body: Builder(
        builder: (context) => Stack(
          children: [
            SingleChildScrollView(
              child: IgnorePointer(
                ignoring: isLoading,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          hintText: 'NAME',
                          iconColor: Colors.white,
                          textFieldController: nameController,
                          errorText: 'Name',
                          validateField: null,
                          verticalPadding: 3,
                        ),
                        CustomTextField(
                          hintText: 'EMAIL ADDRESS',
                          iconColor: Colors.white,
                          textFieldController: emailController,
                          validateField: validateEmail,
                          errorText: 'Email',
                          verticalPadding: 3,
                        ),
                        CustomTextField(
                          hintText: 'PASSWORD',
                          iconColor: iconColor,
                          hide: hideText,
                          isPasswordTF: true,
                          onPressed: togglePasswordTFStatus,
                          textFieldController: passwordController,
                          validateField: validatePassword,
                          errorText: 'Password',
                          verticalPadding: 3,
                        ),
                        CustomTextField(
                          hintText: 'CONFIRM PASSWORD',
                          iconColor: iconColor,
                          hide: hideText,
                          isPasswordTF: true,
                          onPressed: togglePasswordTFStatus,
                          textFieldController: confirmPasswordController,
                          validateField: validateConfirmPassword,
                          errorText: 'Confirm Password',
                          verticalPadding: 3,
                        ),
                        SizedBox(height: 20),
                        CustomCheckBox(
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        CustomFatButton(
                          title: 'Sign up',
                          onPressed: handleSignUp,
                        ),
                        SizedBox(height: 20),
                        CustomThinButton(
                          title: 'Already have and account? Login',
                          onPressed: handleSignUp,
                        ),
                      ],
                    ),
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
