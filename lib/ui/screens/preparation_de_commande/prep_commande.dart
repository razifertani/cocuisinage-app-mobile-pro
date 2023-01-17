import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/models/commande.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/commandes_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/custom_button.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/widgets/prep_commande_widgets copy/item_card.dart';
import '../tutoriel/tutoriel_pop_up.dart';

class PreparationDeCommandeScreen extends StatefulWidget {
  const PreparationDeCommandeScreen({Key? key}) : super(key: key);

  @override
  State<PreparationDeCommandeScreen> createState() => _PreparationDeCommandeScreenState();
}

class _PreparationDeCommandeScreenState extends State<PreparationDeCommandeScreen> {
  Color itemColor = Colors.white;
  int currentIndex = 0;

  switchTab(int value) {
    currentIndex = value;
    setState(() {});
  }

  final ScrollController _controller = ScrollController();
  void scrollAnimated(double position) {
    _controller.animateTo(position, duration: const Duration(milliseconds: 600), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: FittedBox(
            child: AutoSizeText(
              "Préparation de commande",
              style: MyTextStyles.appBarTextStyle,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => TutorielPopUp(
                          title: "Prépation de commande", description: "Chaque employé responsable d’un poste de travail (dessert, entrée,…) reçoit le ticket et la préparation à effectuer. ", numberOfPages: 2, secDescription: "Pour que le ticket soit validé, il faut que l’ensemble des employés responsable d’un poste de travail valide la faisabilité de la préparation (devient vert)."));
                },
                icon: const Icon(Icons.question_mark))
          ],
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tickets en cours",
                    style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).length}",
                    style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // -- pas de tickets
              // Image.asset("assets/images/box.png"),
              // Text(
              //   "  aucune commande en cours ",
              //   style: MyTextStyles.headline,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                child: Row(
                  children: [
                    ...List.generate(
                      Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).length,
                      (index) => GestureDetector(
                        onTap: () {
                          switchTab(index);
                          scrollAnimated(120 * currentIndex.toDouble());
                        },
                        child: currentIndex != index
                            ? Container(
                                margin: const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: MyColors.red)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[index].typeLivraison}\n${Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[index].commingHour}",
                                    style: MyTextStyles.subhead,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFF3A3244),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].typeLivraison}\n${Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].commingHour}",
                                        style: MyTextStyles.subhead.copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                      CustomButton(
                                        txt: "Appeler le serveur",
                                        fun: (startLoading, stopLoading, btnState) {
                                          if (btnState == ButtonState.Idle) {
                                            startLoading();
                                            updateCommandeStatusWS(
                                              id: Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].id,
                                              status: '3',
                                            ).then(
                                              (exceptionOrMessage) {
                                                stopLoading();
                                                exceptionOrMessage.fold(
                                                  (exception) {
                                                    Utils.showCustomTopSnackBar(context, success: false, message: exception.toString());
                                                  },
                                                  (message) {
                                                    setState(() {});
                                                    Utils.showCustomTopSnackBar(context, success: true, message: message);
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].typeLivraison}\n${Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].commingHour}",
                        style: MyTextStyles.headline,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "10mn",
                        style: MyTextStyles.headline.copyWith(color: Colors.blue),
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].commandeProduct.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                        itemBuilder: (context, index) {
                          return ItemCard(
                            commandeProductID: Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].commandeProduct[index].id,
                            name: "${Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].commandeProduct[index].establishmentProduct?.product.name}",
                            quantite: Globals.profile.getEstablishment().commandes.where((element) => element.status == 4).toList()[currentIndex].commandeProduct[index].qte ?? 1,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      currentIndex = (currentIndex - 1) % 4;
                      setState(() {});
                      scrollAnimated(120 * currentIndex.toDouble());
                    },
                    child: Container(
                      height: 8.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors.red),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Précédant",
                            style: MyTextStyles.buttonTextStyle.copyWith(
                              color: MyColors.red,
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      currentIndex = (currentIndex + 1) % 4;
                      setState(() {});
                      scrollAnimated(120 * currentIndex.toDouble());
                    },
                    child: Container(
                      height: 8.h,
                      width: 40.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: MyColors.red), color: MyColors.red),
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Suivant",
                          style: MyTextStyles.buttonTextStyle.copyWith(
                            color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
