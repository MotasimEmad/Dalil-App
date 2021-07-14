import 'package:flutter/material.dart';

import '../sizes_helper.dart';

class SuggestionBtn extends StatelessWidget {
  const SuggestionBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        dispalyWidth(context) * 0.05,
        00.0,
        dispalyWidth(context) * 0.05,
        0.0,
      ),
      width: dispalyWidth(context),
      height: dispalyHeight(context) * 0.05,
      child: FlatButton.icon(
        onPressed: () {},
        color: Colors.teal[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dispalyWidth(context) * 0.03),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          'إقتراح',
          style: TextStyle(fontSize: dispalyWidth(context) * 0.03),
        ),
        textColor: Colors.white,
      ),
    );
  }
}
