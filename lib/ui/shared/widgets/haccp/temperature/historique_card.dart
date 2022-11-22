import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HistoriqueCard extends StatelessWidget {
  String title;
  String? degre;
  Widget? leftWidget;
  bool? eye;
  HistoriqueCard({Key? key, this.degre, required this.title, this.leftWidget, this.eye}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      width: 95.w,
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              leftWidget != null ? leftWidget! : const SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: MyTextStyles.subhead,
                  maxLines: 2,
                ),
              ),
              const Spacer(),
              degre != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        width: 14.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFECECEC),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(child: Text(degre!)),
                      ),
                    )
                  : const SizedBox(),
              const Spacer(),
              eye == true
                  ? GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           const HistoSignatureDetail()),
                        // );
                      },
                      child: Image.asset("assets/haccp_icons/eye.png"))
                  : const SizedBox(),
              const SizedBox(
                width: 5,
              ),
              Image.asset("assets/haccp_icons/pencil-cercled.png"),
              const SizedBox(
                width: 5,
              ),
              Image.asset("assets/haccp_icons/delete-cercled.png")
            ],
          ),
        ),
      ),
    );
  }
}
