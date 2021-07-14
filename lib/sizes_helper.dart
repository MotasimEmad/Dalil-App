import 'package:flutter/material.dart';

Size dispalySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double dispalyWidth(BuildContext context) {
  debugPrint('Width = ' + dispalySize(context).width.toString());
  return dispalySize(context).width;
}

double dispalyHeight(BuildContext context) {
  debugPrint('Height = ' + dispalySize(context).height.toString());
  return dispalySize(context).height;
}