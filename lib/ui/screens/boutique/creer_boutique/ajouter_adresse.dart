import 'package:cocuisinage_app_mobile_pro_mobile_pro/ui/shared/widgets/serach_bar/search_bar.dart';
import 'package:flutter/material.dart';

import '../../../shared/divider.dart';

class AjouterAdresse extends StatefulWidget {
  const AjouterAdresse({Key? key}) : super(key: key);

  @override
  State<AjouterAdresse> createState() => _AjouterAdresseState();
}

class _AjouterAdresseState extends State<AjouterAdresse> {
  TextEditingController rech = TextEditingController();
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
            SearchBar(controller: rech, hintText: "exemple rue xxx")
          ],
        ),
      ),
    );
  }
}
