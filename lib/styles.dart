import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const TextStyle productRowItemName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productRowTotal = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static var productRowItemPrice;

  static var productRowDivider;

  static var searchBackground;

  static var searchIconColor;

  static var searchText;

  static var searchCursorColor;

  static var scaffoldBackground;

  static var textSectionTitle;

  static var textHighlight;

  static var deliveryTime;

  static var deliveryTimeLabel;


}