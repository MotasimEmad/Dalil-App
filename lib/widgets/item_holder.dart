import 'package:flutter/material.dart';
import 'package:responsive/screens/details_page.dart';
import 'package:responsive/screens/items.dart';

import '../sizes_helper.dart';

class ItemHolder extends StatelessWidget {
  final String name, path;
  final int id;

  const ItemHolder({Key? key, required this.name, required this.path, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              itemID: id,
              itemName: name,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: dispalyWidth(context) * 0.5,
                height: dispalyWidth(context) * 0.15,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
              Image.network(
                "http://192.168.43.174/example-app/images/$path",
                width: dispalyWidth(context) * 0.08,
                height: dispalyWidth(context) * 0.08,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(height: dispalyWidth(context) * 0.02),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.teal[400],
              fontSize: dispalyWidth(context) * 0.03,
            ),
          ),
        ],
      ),
    );
  }
}
