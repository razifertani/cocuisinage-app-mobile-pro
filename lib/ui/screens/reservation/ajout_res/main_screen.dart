import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/reservation/ajout_res/personees.dart';
import 'package:flutter/material.dart';

import '../../../../services/reservations_api.dart';
import '../../../shared/custom_button.dart';
import '../../../../services/reservations_api.dart';
import '../../../../utils/utils.dart';
import '../../../shared/widgets/success_show_model/success_show_model.dart';
import 'date.dart';
import 'heure.dart';
import 'information.dart';

class MainResScreen extends StatefulWidget {
  final DateTime resDate;
  final Function function;
  MainResScreen({Key? key, required this.resDate, required this.function})
      : super(key: key);

  @override
  State<MainResScreen> createState() => _MainResScreenState();
}

class _MainResScreenState extends State<MainResScreen> {
  late DateTime date;
  @override
  void initState() {
    date = widget.resDate;
    super.initState();
  }

  void switchIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  int currentIndex = 0;
  List<String> imagesPath = [
    "assets/icons/calend.png",
    "assets/icons/clock.png",
    "assets/icons/personnes.png",
    "assets/icons/information.png"
  ];
  List<String> labels = ["Date", "Heure", "Personnes", "Informations"];

  String timeOfDay = "8:00";
  int? nbrPersonnes;

  GlobalKey<FormState> key = GlobalKey<FormState>();
  Map? infoMap;
  void Valider() {}

  void changeDate(DateTime date) {
    this.date = date;
  }

  void changeHeure(String time) {
    timeOfDay = time;
  }

  void changePersonnes(int nmbr) {
    nbrPersonnes = nmbr;
  }

  void changeInform(Map map) {
    infoMap = map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Réserver",
              style: MyTextStyles.headline,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    4,
                    (index) => GestureDetector(
                      onTap: () {
                        switchIndex(index);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            imagesPath[index],
                            color: currentIndex == index
                                ? Theme.of(context).primaryColor
                                : Color(0xFF8E8E8E),
                          ),
                          Text(
                            labels[index],
                            style: TextStyle(
                                color: currentIndex == index
                                    ? Theme.of(context).primaryColor
                                    : Color(0xFF8E8E8E)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            if (currentIndex == 0)
              DateScreen(
                ondateChanged: changeDate,
                initialDateTime: widget.resDate,
              ),
            if (currentIndex == 1)
              HeureScreen(
                ontimeChanged: changeHeure,
                currentDate: date,
              ),
            if (currentIndex == 2)
              PersonnesScreen(
                onnbrChanged: changePersonnes,
              ),
            if (currentIndex == 3)
              InformationsScreen(
                onInfoChanged: changeInform,
                globalKey: key,
              ),
            SizedBox(
              height: 10,
            ),
            currentIndex <= 3
                ? CustomButton(
                    txt: currentIndex == 3 ? "Réserver" : "Suivant",
                    fun: (startLoading, stopLoading, btnState) {
                      if (currentIndex == 3) {
                        if (btnState == ButtonState.Idle) {
                          if (key.currentState!.validate()) {
                            startLoading();
                            addReservationWS(
                              clientName: infoMap!['nom'],
                              clientPhoneNumber: infoMap!['nmrTlph'],
                              nbPeople: nbrPersonnes.toString(),
                              day: date,
                              hour: timeOfDay,
                            ).then(
                              (exceptionOrMessage) {
                                stopLoading();
                                exceptionOrMessage.fold(
                                  (exception) {
                                    Utils.showCustomTopSnackBar(context,
                                        success: false,
                                        message: exception.toString());
                                    Navigator.pop(context);
                                  },
                                  (message) {
                                    setState(() {});
                                    Utils.showCustomTopSnackBar(context,
                                        success: true, message: message);
                                    widget.function();
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          }
                        }
                      }
                      if (currentIndex < 3) currentIndex++;
                      setState(() {});
                    })
                : SizedBox(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
