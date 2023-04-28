import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/stock/sortie_de_stock/item_settings/prendre_photo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Theme/my_colors.dart';
import '../../../../../Theme/my_text_styles.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/widgets/custom_card_text_form.dart';
import '../../../../shared/widgets/time_picker/pick_date.dart';
import '../../../../shared/widgets/time_picker/pick_time.dart';

class AjouterTracabiliteSortieDeStock extends StatefulWidget {
  AjouterTracabiliteSortieDeStock({Key? key}) : super(key: key);

  @override
  State<AjouterTracabiliteSortieDeStock> createState() =>
      _AjouterTracabiliteSortieDeStockState();
}

class _AjouterTracabiliteSortieDeStockState
    extends State<AjouterTracabiliteSortieDeStock> {
  int currentIndex = 0;

  switchButton(int value) {
    currentIndex = value;

    setState(() {});
  }

  TextEditingController heure = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Ajouter tracabilité",
              style: MyTextStyles.appBarTextStyle,
            ),
            centerTitle: true,
            backgroundColor: MyColors.red,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Service",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      switchButton(0);
                    },
                    child: SizedBox(
                      height: 10.h,
                      width: 38.w,
                      child: Card(
                        color: currentIndex == 0 ? MyColors.red : Colors.white,
                        elevation: 3,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/haccp_icons/matin.png"),
                              Text(
                                "matin",
                                style: MyTextStyles.headline.copyWith(
                                  color: currentIndex != 0
                                      ? MyColors.red
                                      : Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      switchButton(1);
                    },
                    child: SizedBox(
                      height: 10.h,
                      width: 38.w,
                      child: Card(
                        color: currentIndex == 1 ? MyColors.red : Colors.white,
                        elevation: 3,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/haccp_icons/soleil.png"),
                              Text(
                                "midi",
                                style: MyTextStyles.headline.copyWith(
                                  color: currentIndex != 1
                                      ? MyColors.red
                                      : Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Produit(s) ouvert(s) le :",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              PickDate(
                initialDate: DateTime.now(),
                ondateChanged: (date) {},
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Produit(s) ouvert(s) a :",
                style:
                    MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 5,
              ),
              PickTime(
                time: TimeOfDay.now(),
                onTimeChanged: (time) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: CustomButton(
                      txt: "Suivant",
                      fun: (a, b, c) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SortieDeStockPrendrePhoto()),
                        );
                      })),
            ],
          ),
        )),
      ),
    );
  }
}
