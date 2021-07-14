import 'package:flutter/material.dart';
import 'package:responsive/models/item_model.dart';
import 'package:responsive/sizes_helper.dart';
import 'package:responsive/widgets/category_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:responsive/widgets/item_container.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
  final int categoryID;
  final String path;
  final String categoryName;

  const ItemPage({
    required this.categoryName,
    required this.path,
    required this.categoryID,
  });
}

class _ItemPageState extends State<ItemPage> {
  late bool _loading;
  late int id;

  List<ItemModel> itemsList = [];
  late Map getItemsCategoriesMap;
  getItemsCategoriesFunction() async {
    var urlGetAllCategories =
        Uri.parse("http://192.168.43.174:8000/api/${widget.categoryID}/items");
    http.Response response = await http.get(urlGetAllCategories);
    setState(() {
      getItemsCategoriesMap = jsonDecode(response.body);
      if (getItemsCategoriesMap['error'] == false) {
        getItemsCategoriesMap['data'].forEach(
          (element) {
            if (element['id'] != null && element['name'] != null) {
              ItemModel categoriesModel = ItemModel(
                title: element['name'],
                id: element['id'],
              );
              itemsList.add(categoriesModel);
            }
          },
        );
      }
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    getItemsCategoriesFunction();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(
        widget.categoryName,
        style: TextStyle(
          color: Colors.teal[400],
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: _loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.teal[400],
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: dispalyWidth(context) * 0.1),
                child: ItemContainer(itemsList: itemsList),
              ),
      ),
    );
  }
}
