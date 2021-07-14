import 'package:flutter/material.dart';
import 'package:responsive/models/location_model.dart';

import '../sizes_helper.dart';

class LocationContainer extends StatelessWidget {
 final List<LocationModel> locationList;

  const LocationContainer({Key? key, required this.locationList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(dispalyWidth(context) * 0.05),
      width: dispalyWidth(context),
      height: dispalyWidth(context) * 0.5,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dispalyWidth(context) * 0.03),
        ),
        child: Container(
          width: dispalyWidth(context),
          height: dispalyHeight(context),
          child: ListView.builder(
            itemCount: locationList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(dispalyWidth(context) * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          locationList[index].title,
                          style: TextStyle(
                            fontSize: dispalyWidth(context) * 0.03,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.teal[400],
                          child: IconButton(
                            //iconSize: dispalyWidth(context) * 0.2,
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.fromLTRB(
                      dispalyWidth(context) * 0.01,
                      dispalyWidth(context) * 0.01,
                      dispalyWidth(context) * 0.01,
                      dispalyWidth(context) * 0.01,
                    ),
                    color: Colors.grey,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
