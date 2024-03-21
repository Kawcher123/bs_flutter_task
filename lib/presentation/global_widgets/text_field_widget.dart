import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.width,
    this.height,
    this.textcontroller,
    this.ontap,
    this.oneditingComplete,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.prefix,

    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
    this.suffix,
    this.limit,
    this.maxline = 1,
    this.isFill = false,
    this.fillColor = Colors.transparent,
    this.readOnly,
    this.hasBorder=false,
    this.radius,

  }) : super(key: key);

  final double? width;
  final double? height;
  final TextEditingController? textcontroller;
  final VoidCallback? ontap;
  final VoidCallback? oneditingComplete;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool obscureText;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final int? limit;
  final double? radius;
  final int? maxline;
  final bool? isFill;
  final Color? fillColor;
  final bool? readOnly;
  final bool? hasBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textcontroller,
      onTap: ontap ?? () {},
      keyboardType: keyboardType,
      maxLines: maxline,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,

      obscureText: obscureText,
      initialValue: initialValue,
      readOnly: readOnly ?? false,
      onEditingComplete: oneditingComplete,
      textAlign:textAlign?? TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle:  TextStyle(
          fontSize: 14,
          color: Get.theme.disabledColor
        ),
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: suffixIcon,
        prefixIcon: prefix,
        filled: isFill,
        fillColor: fillColor,
        isDense: true,
        border:  OutlineInputBorder(
          borderRadius:  BorderRadius.all(
            Radius.circular(radius?? 10.0),
          ),
          borderSide:hasBorder!?  BorderSide(
            width: 2,
            color: Get.theme.disabledColor,
           // style: BorderStyle.solid,
          ):BorderSide.none,
        ),
      ),
    );
  }
}
