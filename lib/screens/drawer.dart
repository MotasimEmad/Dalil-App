import 'package:flutter/material.dart';
import 'package:responsive/sizes_helper.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.teal[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: dispalyWidth(context) * 0.02,
                        right: dispalyWidth(context) * 0.02,
                      ),
                      width: dispalyWidth(context) * 0.1,
                      height: dispalyHeight(context) * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/svg/map.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(width: dispalyWidth(context) * 0.02),
                    Text(
                      "دليل",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: dispalyWidth(context) * 0.06,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        "عن التطبيق",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      title: Text(
                        "مشاركة التطبيق",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.star_rate,
                        color: Colors.white,
                      ),
                      title: Text(
                        "تقييم التطبيق",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "powered by motasim".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
