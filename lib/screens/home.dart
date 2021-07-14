import 'package:flutter/material.dart';
import 'package:responsive/models/category_model.dart';
import 'package:responsive/sizes_helper.dart';
import 'package:responsive/widgets/category_container.dart';
import 'package:responsive/widgets/header_container.dart';
import 'package:responsive/widgets/suggestion_btn.dart';
import 'package:responsive/widgets/title_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _loading;

  // Get categories FUNCTION
  List<CategoryModel> categoriesList = [];
  late Map getCategoriesMap;
  getCategoriesFunction() async {
    var urlGetAllCategories =
        Uri.parse("http://192.168.43.174:8000/api/categories");
    http.Response response = await http.get(urlGetAllCategories);
    setState(() {
      getCategoriesMap = jsonDecode(response.body);
      if (getCategoriesMap['error'] == false) {
        getCategoriesMap['data'].forEach(
          (element) {
            if (element['id'] != null && element['name'] != null) {
              CategoryModel categoriesModel = CategoryModel(
                title: element['name'],
                path: element['image'],
                id: element['id'],
              );
              categoriesList.add(categoriesModel);
            }
          },
        );
      }
      _loading = false;
    });
  }

  // End get categories FUNCTION

  @override
  void initState() {
    super.initState();
    _loading = true;
    getCategoriesFunction();
  }

  final appBar = AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      "دليل",
      style: TextStyle(
        color: Colors.teal[400],
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: [
      Text(""),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Drawers(),
        appBar: appBar,
        body: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderContainer(),
                SizedBox(height: dispalyWidth(context) * 0.03),
                SuggestionBtn(),
                SizedBox(height: dispalyWidth(context) * 0.03),
                TitleContainer(),
                SizedBox(height: dispalyWidth(context) * 0.03),
                _loading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal[400],
                        ),
                      )
                    : CategoryContainer(categoriesList: categoriesList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
