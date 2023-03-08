import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_colors.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/caisse_widgets/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReductionShowModel extends StatefulWidget {
  const ReductionShowModel({Key? key}) : super(key: key);

  @override
  State<ReductionShowModel> createState() => _ReductionShowModelState();
}

class _ReductionShowModelState extends State<ReductionShowModel> {
  List<double> reductions = [0.5, 0.9, 1.0, 1.5, 1.9, 2];
  int? currentIndex;
  void switchIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      insetPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 45.h,
            width: 85.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset("assets/icons/reduction.png"),
                SizedBox(
                  height: 10,
                ),
                Text("Ajouter une réduction ?", style: MyTextStyles.headline),
                SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 60,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      switchIndex(index);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: currentIndex == index ? MyColors.red : null,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          "${reductions[index]}",
                          style: MyTextStyles.headline.copyWith(
                            color: currentIndex == index ? Colors.white : null,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    txt: "Valider",
                    fun: (a, b, c) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => PaymentSuccess(),
                      );
                    })
              ]),
            ),
          );
        },
      ),
    );
  }
}
