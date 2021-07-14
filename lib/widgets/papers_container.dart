import 'package:flutter/material.dart';
import 'package:responsive/models/detail_model.dart';
import '../sizes_helper.dart';

class PapersContainer extends StatelessWidget {
  final List<DetailModel> detailList;

  const PapersContainer({Key? key, required this.detailList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(dispalyWidth(context) * 0.05),
      width: dispalyWidth(context),
      height: dispalyWidth(context) * 0.4,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dispalyWidth(context) * 0.03),
        ),
        child: Container(
          margin: EdgeInsets.all(dispalyWidth(context) * 0.03),
          width: dispalyWidth(context),
          height: dispalyHeight(context),
          child: ListView.builder(
            itemCount: detailList.length,
            itemBuilder: (context, index) {
              return Text(
                detailList[index].title,
                style: TextStyle(
                  fontSize: dispalyWidth(context) * 0.03,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
