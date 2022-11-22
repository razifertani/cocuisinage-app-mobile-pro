import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Theme/my_text_styles.dart';

class CopyCard extends StatelessWidget {
  String text;
  CopyCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 9.h,
      width: 90.w,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AutoSizeText(
                  text + 'AAAAAAAAAAAAAAAA',
                  maxLines: 2,
                  minFontSize: 1,
                  style: MyTextStyles.body,
                ),
              ),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: text));
                  snackbar(context, "Lien copié");
                },
                icon: Icon(
                  Icons.copy,
                  color: MyColors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

snackbar(context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  // Scaffold.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
  ));
}
