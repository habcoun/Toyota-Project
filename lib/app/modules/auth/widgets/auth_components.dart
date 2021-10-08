import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialIcon extends StatelessWidget {
  final String linkIcon;
  const SocialIcon({
    required this.linkIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 20,
              spreadRadius: 0.2,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        height: 50,
        width: 50,
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              linkIcon,
            ),
          ),
        ),
      ),
    );
  }
}

class CostumTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final dynamic onSubmit;
  final dynamic onChange;
  final dynamic onTap;
  final dynamic validate;
  final dynamic prefix;
  final dynamic suffix;
  final VoidCallback? suffixPressed;
  final bool isPassword;

  CostumTextFormFeild({
    required this.label,
    required this.controller,
    required this.type,
    required this.prefix,
    required this.onSubmit,
    this.onChange,
    required this.validate,
    this.onTap,
    this.suffixPressed,
    this.suffix,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorStyle: GoogleFonts.poppins(
          fontSize: 11,
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFCCCCCC),
            width: 0.1,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        suffixIcon: GestureDetector(
          onTap: suffixPressed,
          child: Icon(
            suffix,
            size: 24,
            color: Color(0xFFCCCCCC),
          ),
        ),
        prefixIcon: GestureDetector(
          onTap: () {},
          child: Icon(
            prefix,
            size: 24,
            color: Color(0xFFCCCCCC),
          ),
        ),
        labelStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFFA8AFB9),
        ),
      ),
      obscureText: isPassword,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      onSaved: onSubmit,
      validator: validate,
    );
  }
}

class MyDividerText extends StatelessWidget {
  final String text;
  const MyDividerText({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 1.0,
            color: Color(0xFFC4C4C4),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFFC4C4C4),
          ),
        ),
        Flexible(
          child: Container(
            height: 1.0,
            color: Color(0xFFC4C4C4),
          ),
        ),
      ],
    );
  }
}

class Defaultbotton extends StatelessWidget {
  Defaultbotton(
      {this.background = Colors.blue,
      this.width = double.infinity,
      required this.text,
      this.radius = 5.0,
      required this.onPress});
  final double width;
  final Color background;
  final String text;
  final double radius;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 65.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFB00000),
            Color(0xffb00022),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.3, 1.0],
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        child: Text(
          text.toUpperCase(),
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
