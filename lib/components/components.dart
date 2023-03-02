import 'package:flutter/material.dart';

import '../color/color.dart';

Widget defaultFormField({
  double radiusFormField = 0.0,
  double width = 0.0,
  double height = 0.0,
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)? validator,
  required String? lable,
  required IconData prefix,
  void Function(String)? onSubmitted,
  void Function(String)? onChanged,
  bool isPassword = false,
  IconData? suffix,
  void Function()? suffixPressed,
  bool isClickable = true,
  void Function()? onTap,
}) =>
    Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(radiusFormField),
      ),
      width: width,
      height: height,
      child: TextFormField(
        enabled: isClickable,
        validator: validator,
        controller: controller,
        onFieldSubmitted: onSubmitted,
        onChanged: onChanged,
        keyboardType: type,
        onTap: onTap,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          border: InputBorder.none,
        ),
      ),
    );
Widget defaultTextButton({
  required void Function()? function,
  required String text,
}) =>
    TextButton(onPressed: function, child: Text(text));
Widget defaultButton({
  bool? borderSide,
  double? elevation,
  Color textColor = whiteColor,
  double width = double.infinity,
  double height = 40,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 0.0,
  required void Function()? function,
  required String text,
}) =>
    ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          side: borderSide == null
              ? null
              : const BorderSide(
                  width: 1, // the thickness
                  color: borderButtonColor, // the color of the border
                ),
          elevation: elevation,
          minimumSize: Size(width, height),
          primary: background,
          // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: textColor),
        ));
// also add OutlinedButton
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

class ClipContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    // path.moveTo(0, 100);
    // path.lineTo(0, h);
    // path.quadraticBezierTo(w * .5, h - 100, w, h);
    // path.lineTo(w, 0);
    // path.close();

    Path path = Path();

    path.lineTo(0, size.height * 0.9275000);
    path.quadraticBezierTo(size.width * 0.1355500, size.height * 0.8857600,
        size.width * 0.1781250, size.height * 0.9014000);
    path.cubicTo(
        size.width * 0.2655500,
        size.height * 0.8863800,
        size.width * 0.5165625,
        size.height * 0.9783750,
        size.width * 0.6293750,
        size.height);
    path.quadraticBezierTo(size.width * 0.8767250, size.height * 1.0025000,
        size.width, size.height * 0.9375000);
    path.lineTo(size.width, 0);

    return path;

    // throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
    // throw UnimplementedError();
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    String pattern =
        '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))';
    RegExp regex = RegExp(pattern);
    // if hasMatch true email valid
    return regex.hasMatch(email);
  }
}
