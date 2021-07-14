import 'package:flutter/material.dart';
import 'package:responsive/models/detail_model.dart';
import 'package:responsive/models/location_model.dart';
import 'package:responsive/widgets/location_container.dart';
import 'package:responsive/widgets/papers_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../sizes_helper.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
  final int itemID;
  final String itemName;

  const DetailsPage({required this.itemID, required this.itemName});
}

class _DetailsPageState extends State<DetailsPage> {
  late bool _loading;
  late int id;

  List<DetailModel> papaerList = [];
  late Map getPapersMap;
  getItemsCategoriesFunction() async {
    var urlGetPapers =
        Uri.parse("http://192.168.43.174:8000/api/${widget.itemID}/paper");
    http.Response response = await http.get(urlGetPapers);
    setState(() {
      getPapersMap = jsonDecode(response.body);
      if (getPapersMap['error'] == false) {
        getPapersMap['data'].forEach(
          (element) {
            if (element['id'] != null && element['name'] != null) {
              DetailModel newsModel = DetailModel(
                title: element['name'],
              );
              papaerList.add(newsModel);
            }
          },
        );
      }
      _loading = false;
    });
  }

  List<LocationModel> locationsList = [];
  late Map getLocationsMap;
  getLocationsCategoriesFunction() async {
    var urlGetLocations =
        Uri.parse("http://192.168.43.174:8000/api/${widget.itemID}/location");
    http.Response response = await http.get(urlGetLocations);
    setState(() {
      getPapersMap = jsonDecode(response.body);
      if (getPapersMap['error'] == false) {
        getPapersMap['data'].forEach(
          (element) {
            if (element['id'] != null && element['name'] != null) {
              LocationModel newsModel = LocationModel(
                title: element['name'],
                lan: element['lan'],
                lat: element['lat'],
              );
              locationsList.add(newsModel);
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
    getLocationsCategoriesFunction();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(
        "إجراء حكومي",
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: dispalyWidth(context) * 0.05,
                  top: dispalyWidth(context) * 0.05,
                ),
                width: dispalyWidth(context),
                child: Text(
                  "الاوراق المطلوبة",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.teal[400],
                    fontSize: dispalyWidth(context) * 0.03,
                  ),
                ),
              ),
              _loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal[400],
                      ),
                    )
                  : PapersContainer(detailList: papaerList),
              Container(
                margin: EdgeInsets.only(
                  right: dispalyWidth(context) * 0.05,
                  top: dispalyWidth(context) * 0.05,
                ),
                width: dispalyWidth(context),
                child: Text(
                  "مكان عمل الإجراء",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.teal[400],
                    fontSize: dispalyWidth(context) * 0.03,
                  ),
                ),
              ),
              _loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal[400],
                      ),
                    )
                  : LocationContainer(locationList: locationsList),
            ],
          ),
        ),
      ),
    );
  }
}
