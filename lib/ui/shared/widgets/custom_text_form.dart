import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAuthTextForm extends StatelessWidget {
  Color? color;
  TextEditingController contr;
  String? label;
  Icon? suffixIcon;
  TextInputType? keybordType;
  int? maxLines;
  int? minLines;
  String? hint;

  CustomAuthTextForm(
      {Key? key,
      required this.contr,
      this.color,
      this.label,
      this.suffixIcon,
      this.keybordType = TextInputType.name,
      this.maxLines = 1,
      this.minLines = 1,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      width: 90.w,
      child: TextFormField(
        maxLines: maxLines,
        minLines: minLines,
        controller: contr,
        keyboardType: keybordType,
        validator: (value) {
          if (value!.isEmpty) {
            return "* Champ obligatoire";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label ?? ""),
          filled: true,
          fillColor: color,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
        ),
      ),
    );
  }
}
