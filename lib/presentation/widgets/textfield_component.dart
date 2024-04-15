import 'package:dgtix_app/core/utils/colors.dart';
import 'package:dgtix_app/core/utils/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  Widget? suffixIcon;
  Widget? preffixIcon;
  bool? filled;
  bool? obscureText;
  InputBorder? inputBorder;
  Color? hintTextColor;
  Color? inputTextColor;
  Color? cursorColor;
  void Function()? onTap;
  void Function(String)? onChanged;
  TextEditingController? controller;
  String? Function(String?)? validator;

  TextFieldComponent({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.preffixIcon,
    this.filled,
    this.inputBorder,
    this.hintTextColor,
    this.inputTextColor,
    this.cursorColor,
    this.onTap,
    this.onChanged,
    this.controller,
    this.validator,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: (obscureText == null) ? false : obscureText!,
        cursorColor:
            (cursorColor == null) ? AppColor.primaryColor : cursorColor,
        style: AppFont.montserrat(
          14,
          FontWeight.w500,
          color:
              (inputTextColor == null) ? AppColor.primaryColor : inputTextColor,
        ),
        decoration: InputDecoration(
          errorStyle: AppFont.montserrat(
            12,
            FontWeight.w500,
            color: AppColor.redLogout,
          ),
          hintText: hintText,
          hintStyle: AppFont.montserrat(
            13,
            FontWeight.w500,
            color: (hintTextColor == null) ? AppColor.greyColor : hintTextColor,
          ),
          prefixIcon: (preffixIcon == null) ? null : preffixIcon,
          filled: (filled == null) ? true : filled,
          contentPadding: EdgeInsets.only(
            bottom: 10,
            left: 10,
            top: 10,
          ),
          fillColor: AppColor.greyTextField,
          enabledBorder: (inputBorder == null)
              ? OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                )
              : inputBorder,
          focusedBorder: (inputBorder == null)
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
              : inputBorder,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: suffixIcon,
          ),
        ),
      ),
    );
  }
}
