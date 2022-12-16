import 'package:cocuisinage_app_mobile_pro_mobile_pro/Theme/my_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/my_colors.dart';

class PersonnesScreen extends StatefulWidget {
  const PersonnesScreen({Key? key}) : super(key: key);

  @override
  State<PersonnesScreen> createState() => _PersonnesScreenState();
}

class _PersonnesScreenState extends State<PersonnesScreen> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Nombre de personnes avec vous : ",
            style: MyTextStyles.subhead,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (counter > 0) counter--;
                  setState(() {});
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.remove,
                      color: MyColors.red,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: Card(
                  child: Center(child: Text('$counter')),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  counter++;
                  setState(() {});
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add,
                      color: MyColors.red,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
