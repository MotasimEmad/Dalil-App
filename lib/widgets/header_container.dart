import 'package:flutter/material.dart';

import '../sizes_helper.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dispalyWidth(context),
      margin: EdgeInsets.fromLTRB(
        0.0,
        dispalyWidth(context) * 0.05,
        dispalyWidth(context) * 0.05,
        0.0,
      ),
      //  height: dispalyHeight(context) - MediaQuery.of(context).padding.top - kToolbarHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "دليل",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal[400],
              fontSize: dispalyWidth(context) * 0.08,
            ),
          ),
          SizedBox(height: dispalyWidth(context) * 0.01),
          Text(
            "تطبيق بخليك تعرف الاماكن والاوراق المطلوبة منك عشان تعمل الإجراءات الحكومية وما تمسك زمن كتير.",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              color: Colors.grey,
              fontSize: dispalyWidth(context) * 0.03,
            ),
          ),
        ],
      ),
    );
  }
}
