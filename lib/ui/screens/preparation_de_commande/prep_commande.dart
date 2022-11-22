import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_colors.dart';
import '../../../Theme/my_text_styles.dart';
import '../../shared/widgets/prep_commande_widgets copy/item_card.dart';

class PreparationDeCommandeScreen extends StatefulWidget {
  const PreparationDeCommandeScreen({Key? key}) : super(key: key);

  @override
  State<PreparationDeCommandeScreen> createState() =>
      _PreparationDeCommandeScreenState();
}

class _PreparationDeCommandeScreenState
    extends State<PreparationDeCommandeScreen> {
  Color itemColor = Colors.white;
  int currentIndex = 0;

  switchTab(int value) {
    currentIndex = value;
    setState(() {});
  }

  final ScrollController _controller = ScrollController();
  void scrollAnimated(double position) {
    _controller.animateTo(position,
        duration: const Duration(milliseconds: 600), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AutoSizeText(
            "Préparation de commande",
            overflow: TextOverflow.clip,
            style: MyTextStyles.appBarTextStyle,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.question_mark))
          ],
          centerTitle: true,
          backgroundColor: MyColors.red,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context))),
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
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "4",
                    style: MyTextStyles.headline
                        .copyWith(fontWeight: FontWeight.w600),
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
                      4,
                      (index) => GestureDetector(
                        onTap: () {
                          switchTab(index);
                          scrollAnimated(120 * currentIndex.toDouble());
                        },
                        child: currentIndex != index
                            ? Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: MyColors.red)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Table ${index + 1}-24-15h:22",
                                    style: MyTextStyles.subhead,
                                  ),
                                ),
                              )
                            : Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xFF3A3244),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text("Table ${index + 1}-24-15h:22",
                                          style: MyTextStyles.subhead
                                              .copyWith(color: Colors.white)),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: MyColors.red,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.phone,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                "Appeler le serveur",
                                                style: MyTextStyles.body
                                                    .copyWith(
                                                        color: Colors.white),
                                              )
                                            ],
                                          ),
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
                        "Table 1-24-15h:22",
                        style: MyTextStyles.headline,
                      ),
                      Text(
                        "10mn",
                        style:
                            MyTextStyles.headline.copyWith(color: Colors.blue),
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
                      ItemCard(name: "Menu pizza", quantite: 1),
                      const SizedBox(
                        height: 10,
                      ),
                      ItemCard(name: "quiche lorraine", quantite: 3),
                      const SizedBox(
                        height: 10,
                      ),
                      ItemCard(name: "steak-tartare", quantite: 2),
                      const SizedBox(
                        height: 10,
                      ),
                      ItemCard(name: "aligot", quantite: 2),
                      const SizedBox(
                        height: 20,
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MyColors.red),
                          color: MyColors.red),
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text("Suivant",
                            style: MyTextStyles.buttonTextStyle.copyWith(
                              color: Colors.white,
                            )),
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
