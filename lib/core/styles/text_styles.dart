import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle heading1(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 54),
      fontWeight: FontWeight.w700,
      fontFamily: "PlusJakartaSans",
      // height: 2.04,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle heading2(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 42),
      fontWeight: FontWeight.w700,
      fontFamily: "PlusJakartaSans",
      // height: 2.62,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle heading3(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontWeight: FontWeight.w700,
      fontFamily: "PlusJakartaSans",
      // height: 3.44,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle heading4(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 5.83,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle heading5(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      fontFamily: "PlusJakartaSans",
      // height: 7,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle heading6(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 7.78,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle subtitleM(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 8.75,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle subtitleS(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 10,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyL(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 7.78,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyM(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      fontFamily: "PlusJakartaSans",
      // height: 8.75,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyS(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 10,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyXxs(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 17.5,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 7,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle buttonL(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 7,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle buttonM(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 8.75,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle buttonS(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w700,
      fontFamily: "PlusJakartaSans",
      // height: 10,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle menuTabs(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      fontFamily: "PlusJakartaSans",
      // height: 8.75,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.none,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double width = MediaQuery.of(context).size.width;
  if (width < 400) {
    return fontSize;
  } else if (width < 600) {
    return fontSize;
  } else if (width < 900) {
    return fontSize - 3;
  } else if (width < 1000) {
    return fontSize - 2;
  } else if (width < 1200) {
    return fontSize - 1;
  } else {
    return fontSize;
  }
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  // Adjust scale factor to make it smaller on smaller screens
  if (width < 600) {
    return width / 400; // Smaller divisor makes scale smaller
  } else if (width < 1200) {
    return width / 600; // Adjusted for medium-sized screens
  } else {
    return width / 1920; // Default for larger screens
  }
}
