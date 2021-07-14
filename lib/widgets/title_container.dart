import 'package:flutter/material.dart';

import '../sizes_helper.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: dispalyWidth(context) * 0.05,
        top: dispalyWidth(context) * 0.02,
      ),
      width: dispalyWidth(context),
      child: Text(
        "الفئات",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: dispalyWidth(context) * 0.03,
        ),
      ),
    );
  }
}
