import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBar extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String hintText;
  Color? bgColor;
  Color? hintTextcolor;
  double? width;
  bool? filled;
  SearchBar(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.bgColor,
      this.hintTextcolor = Colors.grey,
      this.width,
      this.filled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 9.h,
        width: width ?? 90.w,
        child: Card(
          color: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Center(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: hintTextcolor),
                // filled: filled,
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
