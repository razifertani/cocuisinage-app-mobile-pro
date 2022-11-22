import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Theme/my_text_styles.dart';

class PopUpCard extends StatelessWidget {
  String title;
  Function(Function, Function, ButtonState) fun;
  String? iconPath;
  PopUpCard({Key? key, required this.title, required this.fun, this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      onTap: fun,
      height: 9.h,
      width: 90.w,
      minWidth: 90.w,
      borderRadius: 15.0,
      color: Colors.white,
      elevation: 7,
      roundLoadingShape: false,
      loader: SpinKitRing(
        color: Color(0xFF5D5D5D),
        size: 40,
        lineWidth: 4,
      ),
      child: iconPath == null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: MyTextStyles.subhead,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Image.asset(iconPath!),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    style: MyTextStyles.subhead,
                  ),
                ],
              ),
            ),
    );
  }
}
