import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCardTextForm extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  String hintText;
  bool? centerHint;
  int? minLines;
  int? maxLines;
  double? borderRaduis;
  Widget? suffixIcon;
  TextInputType? textInputType;
  bool? obscureText = false;
  String? Function(String?)? validator;
  bool? disabled;

  CustomCardTextForm(
      {Key? key,
      this.controller,
      required this.hintText,
      this.centerHint = false,
      this.minLines,
      this.maxLines,
      this.borderRaduis,
      this.suffixIcon,
      this.obscureText,
      this.textInputType,
      this.validator,
      this.disabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h.clamp(65, 95),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 10),
        ),
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Center(
            child: TextFormField(
              style: TextStyle(fontSize: 14.sp.clamp(16, 24)),
              keyboardType: textInputType ?? TextInputType.name,
              controller: controller,
              textAlign: centerHint! ? TextAlign.center : TextAlign.start,
              obscureText: obscureText ?? false,
              decoration: InputDecoration(
                  suffixIcon: suffixIcon ?? const SizedBox(),
                  hintText: hintText,
                  errorStyle: TextStyle(fontSize: 15.sp.clamp(18, 25)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 17.sp.clamp(20, 30))),
              minLines: minLines ?? 1,
              maxLines: maxLines ?? 1,
              validator: validator,
              readOnly: disabled ?? false,
            ),
          ),
        ),
      ),
    );
  }
}
