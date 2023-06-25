import 'package:flutter/material.dart';

import '../resources/colors.dart';
import 'my_outline_btn.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {Key? key, required this.onTapLove, required this.onTapPerson})
      : super(key: key);
  final VoidCallback onTapLove;
  final VoidCallback onTapPerson;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      backgroundColor: Colors.white,
      leadingWidth: 0,
      actions: [
        MYOutlineBtn(
          padding: const EdgeInsets.symmetric(vertical: 4),
          icon: Icons.favorite,
          iconColor: kBlueIcon,
          bColor: kGreyFont.withOpacity(0.5),
          function: () {
            print("11111");
          },
        ),
        MYOutlineBtn(
            padding: const EdgeInsets.symmetric(vertical: 4),
            icon: Icons.person,
            iconColor: kBlueIcon,
            bColor: kGreyFont.withOpacity(0.5),
            function: () {
              print("2222");
            }),
        const SizedBox(
          width: 16,
        )
      ],
      floating: true,
      snap: true,
      pinned: true,
      flexibleSpace: const FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.only(start: 18),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Play",
              style: TextStyle(
                color: kRedFont,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Be the first!",
              style: TextStyle(
                color: kGreyFont,
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
