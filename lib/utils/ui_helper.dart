import 'package:flutter/material.dart';

class UiHelper {
  static Text customText(
      {required String text,
      double? fontSize,
      int? maxLine,
      Color? color,
      FontWeight? fontWeight,
      double? height,
      TextOverflow? overflow}) {
    return Text(
      text,
      maxLines: maxLine,
      style: TextStyle(
        height: height,
        overflow: overflow ?? TextOverflow.ellipsis,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static Image assetImage(
      {required String image, double? height, double? width, BoxFit? boxfit}) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: boxfit,
    );
  }

  static Image networkImage(
      {required String image, double? height, double? width, BoxFit? boxfit}) {
    return Image.network(
      image,
      height: height,
      width: width,
      fit: boxfit,
    );
  }
}
