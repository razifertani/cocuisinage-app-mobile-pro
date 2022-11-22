import 'package:auto_size_text/auto_size_text.dart';
import 'package:cocuisinage_app_mobile_pro/models/planning.dart';
import 'package:cocuisinage_app_mobile_pro/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../Theme/my_text_styles.dart';

class EquipeTimeCard extends StatefulWidget {
  List<Planning> plannings;
  String text;
  Function function;
  EquipeTimeCard({Key? key, required this.plannings, required this.text, required this.function}) : super(key: key);

  @override
  State<EquipeTimeCard> createState() => _EquipeTimeCardState();
}

class _EquipeTimeCardState extends State<EquipeTimeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
      },
      child: SizedBox(
        height: 12.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Row(
            children: [
              SizedBox(
                width: 20.w,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ...List.generate(
                          widget.plannings.length > 3 ? 3 : widget.plannings.length,
                          (index) => Positioned(
                            left: index * 20,
                            top: 10,
                            child: CircleAvatar(
                              radius: 3.h,
                              backgroundImage: NetworkImage(Globals.profile.getColleague(id: widget.plannings[index].professionalId).imageUrl),
                              child: Material(
                                shape: const CircleBorder(),
                                clipBehavior: Clip.hardEdge,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 50.w,
                child: AutoSizeText(
                  widget.text,
                  maxLines: 1,
                  style: MyTextStyles.headline,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
