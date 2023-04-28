import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../Theme/my_text_styles.dart';

class PreparationIngCard extends StatelessWidget {
  const PreparationIngCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        height: 100.w > 600 ? 90 : 70,
        width: double.infinity.clamp(80, 600),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const ProductScreen()),
                // );
              },
              child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
                  child: Material(
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                  )),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              child: AutoSizeText("Pavés de saumon ",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: MyTextStyles.subhead),
            ),
            const SizedBox(
              width: 10,
            ),
            AutoSizeText("150 g",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: MyTextStyles.subhead),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
