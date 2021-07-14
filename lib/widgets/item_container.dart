import 'package:flutter/material.dart';
import 'package:responsive/models/category_model.dart';
import 'package:responsive/models/item_model.dart';
import 'package:responsive/widgets/item_holder.dart';
import '../sizes_helper.dart';
import 'category_item.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({required this.itemsList});

  final List<ItemModel> itemsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dispalyWidth(context),
      height: dispalyHeight(context),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return ItemHolder(
            path: itemsList[index].id.toString(),
            name: itemsList[index].title,
            id: itemsList[index].id,
          );
        },
      ),
    );
  }
}
