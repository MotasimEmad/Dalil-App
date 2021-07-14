import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../sizes_helper.dart';

class SuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final appBar = AppBar(
      backgroundColor: Colors.teal[400],
      elevation: 0,
      title: Text(
        "دليل",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(dispalyWidth(context) * 0.05),
                    width: dispalyWidth(context),
                    height: dispalyHeight(context) * 0.30,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(dispalyWidth(context) * 0.03),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(dispalyWidth(context) * 0.02),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "كتابة إقتراح ...",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: dispalyWidth(context) * 0.05,
                      left: dispalyWidth(context) * 0.05,
                    ),
                    child: FlatButton(
                      child: Center(
                        child: Text(
                          "إرسال",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () {},
                      color: Colors.teal[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(   dispalyWidth(context) * 0.02),
                      ),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
