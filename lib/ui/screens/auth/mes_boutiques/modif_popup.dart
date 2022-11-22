import 'package:flutter/material.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/estbalishments_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/screens/auth/modifier_boutique/modifier_boutique.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/divider.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/utils.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/widgets/roles/delete_confirmation_popup.dart';

class ModifBoutiquePopUp extends StatefulWidget {
  final Function? function;
  const ModifBoutiquePopUp({
    this.function,
    Key? key,
  }) : super(key: key);

  @override
  State<ModifBoutiquePopUp> createState() => _ModifBoutiquePopUpState();
}

class _ModifBoutiquePopUpState extends State<ModifBoutiquePopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          MyDivider(),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ModifierBoutiqueScreen())));
            },
            child: SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/edit.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Modifier boutique", style: MyTextStyles.headline),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              // showDialog(
              //   context: context,
              //   builder: (_) => ConfirmationShowmodel(
              //     title: "Voulez-vous vraiment supprimer ce boutique ?",
              //   ),
              // ).then((value) => widget.function?.call());
              Navigator.pop(context);
              bool toDelete = await showDialog(
                context: context,
                builder: (_) => ConfirmationShowmodel(
                  title: "Voulez-vous vraiment supprimer ce boutique ?",
                ),
              );
              if (toDelete) {
                deleteEstablishmentWS(
                  establishmentID: Globals.params.currentEstablishmentID!,
                ).then((exceptionOrMessage) {
                  exceptionOrMessage.fold(
                    (exception) {
                      Utils.showCustomTopSnackBar(context,
                          success: false, message: exception.toString());
                      // setState(() {});
                      // if (mounted) {
                      widget.function?.call();
                      // }
                    },
                    (message) {
                      // if (mounted) {
                      widget.function?.call();
                      // }

                      // setState(() {});
                      // Utils.showCustomTopSnackBar(context,
                      //     success: true, message: message);
                    },
                  );
                });
              }
              // widget.function?.call();
            },
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: Color(0xFFFFE3E6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/trash.png",
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Supprimer boutique", style: MyTextStyles.headline),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
