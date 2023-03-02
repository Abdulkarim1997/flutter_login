import 'package:flutter/material.dart';
import 'package:flutter_login/login_scrren.dart';

import 'color/color.dart';
import 'components/components.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController textEditingControllerPassword = TextEditingController();

  TextEditingController textEditingControllerUserName = TextEditingController();

  TextEditingController textEditingControllerEmail = TextEditingController();

  TextEditingController textEditingControllerPhone = TextEditingController();

  TextEditingController textEditingControllerConfirmPassword =
      TextEditingController();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: ClipContainer(),
                    child: Container(
                      color: defaultColor,
                      width: double.infinity,
                      height: height * 0.3,
                      child: Center(
                          child: Text(
                        "Register",
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      )),
                    ),
                  ),
                  Positioned(
                      top: height / 30,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ))),
                ],
              ),
              SizedBox(
                height: height * .04,
              ),
              defaultFormField(
                radiusFormField: 10,
                width: width * .85,
                height: height * .085,
                prefix: Icons.person_outline,
                controller: textEditingControllerUserName,
                lable: "Full Name",
                validator: (String? val) {},
                type: TextInputType.name,
              ),
              defaultFormField(
                radiusFormField: 10,
                width: width * .85,
                height: height * .085,
                prefix: Icons.phone_outlined,
                controller: textEditingControllerPhone,
                lable: "Phone",
                validator: (String? val) {},
                type: TextInputType.phone,
              ),
              defaultFormField(
                radiusFormField: 10,
                width: width * .85,
                height: height * .085,
                prefix: Icons.email_outlined,
                controller: textEditingControllerEmail,
                lable: "Email",
                validator: (String? val) {},
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
                  validator: (String? val) {},
                  type: TextInputType.visiblePassword,
                  suffix: isPassword
                      ? Icons.visibility_off_rounded
                      : Icons.visibility,
                  suffixPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  }),
              defaultFormField(
                  radiusFormField: 10,
                  width: width * .85,
                  height: height * .085,
                  isPassword: isConfirmPassword,
                  prefix: Icons.lock_outline_rounded,
                  controller: textEditingControllerConfirmPassword,
                  lable: "Confirm Password",
                  validator: (String? val) {},
                  type: TextInputType.visiblePassword,
                  suffix: isConfirmPassword
                      ? Icons.visibility_off_rounded
                      : Icons.visibility,
                  suffixPressed: () {
                    setState(() {
                      isConfirmPassword = !isConfirmPassword;
                    });
                  }),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 10.0,
                ),
                child: defaultButton(
                    elevation: 0.0,
                    function: () {},
                    text: "Register",
                    isUpperCase: false,
                    radius: 20,
                    width: width * .85),
              ),
              SizedBox(
                height: height * .01,
              ),
              defaultButton(
                  borderSide: true,
                  elevation: 0.0,
                  function: () {
                    debugPrint("SizedBox");
                    navigateAndFinish(context, LoginScreen());
                  },
                  textColor: defaultColor,
                  text: "Login",
                  background: whiteColor,
                  isUpperCase: false,
                  radius: 20,
                  width: width * .85),
            ],
          ),
        ),
      ),
    );
  }
}
