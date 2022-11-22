import 'package:cocuisinage_app_mobile_pro/Theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Utils {
  static RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp mobileRegExp = RegExp(r'^[0-9]+$');

  static Future<Object?> pushScreen(
      BuildContext context, Widget widget, double heightFactor) async {
    return await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => FractionallySizedBox(
        heightFactor: heightFactor,
        child: widget,
      ),
    );
  }

  static showCustomTopSnackBar(BuildContext context,
      {required bool success, required String message}) {
    showTopSnackBar(
      context,
      success
          ? CustomSnackBar.success(
              message: message,
              maxLines: 2,
              // backgroundColor: MyColors.snackbarErrorColor,
            )
          : CustomSnackBar.error(
              message: message,
              maxLines: 2,
              backgroundColor: MyColors.snackbarErrorColor,
            ),
      dismissType: DismissType.onSwipe,
    );
  }
}

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day &&
        now.month == this.month &&
        now.year == this.year;
  }

  bool isSameDayAs(DateTime dateTime) {
    return dateTime.day == this.day &&
        dateTime.month == this.month &&
        dateTime.year == this.year;
  }
}
