import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const Color rgbBahgaPurple3 = Color.fromRGBO(25, 0, 153, 1);
const Color rgbBahgaPurple1 = Color.fromRGBO(158, 163, 253, 1);
const Color rgbBahgaPurple2 = Color.fromRGBO(89, 97, 249, 1);
const Color rgbBahgaBlue1 = Color.fromRGBO(1, 153, 255, 1);
const Color rgbBahgagrey1_5 = Color.fromRGBO(111, 112, 111, .5);
const Color rgbBahgaBlack1 = Color.fromRGBO(34, 40, 49, 1);
const Color rgbBahgaWhite1 = Colors.white;


Widget buildTextJost({
  required String text,
  Color textColor = rgbBahgaPurple3,
  required double textSize,
  FontWeight textBold = FontWeight.bold,
  TextAlign textAlign = TextAlign.center,
}) =>
    Text(
      text,
      style: TextStyle(
          fontFamily: 'JostBold',
          fontWeight: textBold,
          fontSize: textSize,
          color: textColor),
      textAlign: textAlign,
    );

Widget buildFormFieldText({
  required TextEditingController controller,
  required String labelText,
  String? hintText,
  TextInputType keyboardType = TextInputType.name,
  IconData? prefixIcon,
  Color prefixIconColor = rgbBahgaPurple3,
  validate,
  IconData? suffix,
  Color suffixColor = rgbBahgaPurple3,
  suffixPressed, // Function
  bool isSecure = false,
  onSubmit,
  onChange,
  Function()? onTap,
  bool isClickable = true,
  Color backgroundOfTextFeild = Colors.white,
  Color notFocusedBorderColor = rgbBahgaPurple1,
  Color focusedBorderColor = rgbBahgaPurple3,
}) =>
    TextFormField(
      obscureText: isSecure,
      validator: validate,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(
            color: focusedBorderColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        filled: true,
        fillColor: backgroundOfTextFeild,
        border: const OutlineInputBorder(
          // borderSide: BorderSide(width: 3, color: Colors.yellowAccent),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: notFocusedBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: focusedBorderColor, width: 2),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "JostBold",
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: prefixIconColor),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix, color: suffixColor),
        ),
      ),
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      enabled: isClickable,
    );