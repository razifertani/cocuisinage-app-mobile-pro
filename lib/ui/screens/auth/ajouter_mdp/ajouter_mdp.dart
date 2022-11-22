import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import '../../../../Theme/my_colors.dart';
import '../../../../Theme/my_text_styles.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/widgets/custom_card_text_form.dart';

class AddPasswordScreen extends StatefulWidget {
  Function onTap;
  AddPasswordScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController mdp = TextEditingController();
  TextEditingController cMdp = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Ajouter mot de passe",
            style: MyTextStyles.appBarTextStyle,
          ),
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ajouter Votre mot de passe",
                  style: MyTextStyles.headline.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomCardTextForm(
                  controller: mdp,
                  hintText: "Mot de passe",
                  obscureText: !isVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                  ),
                  validator: (String? value) {
                    if (value!.length < 4) {
                      return 'Mot de passe est trop court';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCardTextForm(
                  controller: cMdp,
                  hintText: "Confirmer",
                  obscureText: !isVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                  ),
                  validator: (String? value) {
                    if (value != mdp.text) {
                      return 'Mots de passe ne sont pas conformes';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Spacer(),
                Center(
                  child: CustomButton(
                    txt: "Valider",
                    fun: (startLoading, stopLoading, btnState) {
                      if (btnState == ButtonState.Idle) {
                        if (key.currentState!.validate()) {
                          widget.onTap(mdp.text);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
