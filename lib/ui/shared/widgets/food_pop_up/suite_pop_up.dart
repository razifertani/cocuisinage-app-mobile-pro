import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/divider.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/pop_up_card.dart';
import 'package:flutter/material.dart';

class SuitePopUp extends StatelessWidget {
  Function? callBack;
  SuitePopUp({Key? key, this.callBack}) : super(key: key);
  List<String> names = [
    "Suite 1",
    "Suite 2",
    "Suite 3",
    "Menu-kids",
    "Menu",
  ];
  List<String> images = [
    ...List.generate(3, (index) => "assets/icons/suite.png"),
    "assets/icons/menu-kids.png",
    "assets/icons/menu.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const MyDivider(),
          const SizedBox(
            height: 20,
          ),
          ...List.generate(
            names.length,
            (index) => PopUpCard(
                title: names[index],
                fun: (startLoading, stopLoading, btnState) {
                  callBack?.call();
                },
                iconPath: images[index]),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
