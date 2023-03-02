import 'package:flutter/material.dart';
import 'package:flutter_login/animated_list.dart';
import 'package:flutter_login/register_screen.dart';

import 'color/color.dart';
import 'components/components.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingControllerPassword = TextEditingController();

  TextEditingController textEditingControllerEmail = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isPassword = true;

  bool isConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipPath(
                  clipper: ClipContainer(),
                  child: Container(
                    color: defaultColor,
                    width: double.infinity,
                    height: height * 0.3,
                    child: Center(
                        child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    )),
                  ),
                ),
                SizedBox(
                  height: height * .1,
                ),
                defaultFormField(
                  radiusFormField: 10,
                  width: width * .85,
                  height: height * .085,
                  prefix: Icons.email_outlined,
                  controller: textEditingControllerEmail,
                  lable: "Email",
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return "Please enter your email.";
                    } else if (textEditingControllerEmail.text.contains("@") ==
                            false ||
                        textEditingControllerEmail.text.contains(".") ==
                            false) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  type: TextInputType.emailAddress,
                ),
                defaultFormField(
                    radiusFormField: 10,
                    width: width * .85,
                    height: height * .085,
                    prefix: Icons.lock_outline_rounded,
                    controller: textEditingControllerPassword,
                    lable: "Password",
                    isPassword: isPassword,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return "Please enter your password.";
                      } else if (val.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                      return null;
                    },
                    type: TextInputType.visiblePassword,
                    suffix: isPassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility,
                    suffixPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    }),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: height / 45,
                  ),
                  child: defaultButton(
                      elevation: 0.0,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          // formKey.currentState!.save();
                          navigateTo(context, AnimatedListScreen());
                          print(textEditingControllerEmail.text);
                        }
                      },
                      text: "Login",
                      isUpperCase: false,
                      radius: 20,
                      width: width * .75),
                ),
                SizedBox(
                  height: height * .01,
                ),
                defaultButton(
                    borderSide: true,
                    elevation: 0.0,
                    function: () {
                      debugPrint("SizedBox");
                      navigateTo(context, RegisterScreen());
                    },
                    textColor: defaultColor,
                    text: "Register",
                    background: whiteColor,
                    isUpperCase: false,
                    radius: 20,
                    width: width * .75),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
