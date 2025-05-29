import 'package:flutter/material.dart';

abstract class AppColors {
  static const colorsPrimary = LinearGradient(
    colors: [Color(0xff184b46), Color(0xff0c1f1d)],
  );
  static const Color colorsPrimary2 = Color(0xff184b46);

  static const Color lightGreenColor = Color(0xffC2EBE7);
  static const Color lightYellosColor = Color(0xffF9ECC4);
  static const Color lightRedColor = Color(0xffE1C7C7);
  static const Color yellowColor = Color(0xffA88314);

  static const Color red = Color(0xff6A0202);

  static const colorsSecondary = LinearGradient(
    colors: [Color(0xffb99f6e), Color(0xff3d2e12)],
  );

  static const Color colorsSecondary2 = Color(0xff847A5C);

  static const Color colorsText = Color(0xff0c2d2a);

  static const Color colorsSecText = Color(0x990d2e2b);

  static const Color colorsBackground = Color(0xffededed);

  static const Color colorsSurface = Color(0xffffffff);

  static const Color greyScaleAlmostBlack = Color(0xff1a1a1a);

  static const Color greyScaleCharcoalGrey = Color(0xff333333);

  static const Color greyScaleDarkGrey = Color(0xff4d4d4d);

  static const Color greyScaleMediumGrey = Color(0xff808080);

  static const Color greyScaleLightGrey = Color(0xffb3b3b3);

  static const Color greyScaleNearWhite = Color(0xffc3c3c3);

  static const Color trafficLightColorsSuccess = Color(0xff28a745);

  static const Color trafficLightColorsWarning = Color(0xffffc107);

  static const Color trafficLightColorsError = Color(0xffdc3545);

  static const texturesButtonTexture = LinearGradient(
    colors: [Color(0xff184b46), Color(0xff0c1f1d)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const whiteGrad = LinearGradient(
    colors: [
      Color.fromARGB(255, 252, 252, 252),
      Color.fromARGB(255, 254, 254, 254),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const texturesGoldenTexture = LinearGradient(
    colors: [Color(0xffb99f6e), Color(0xff3d2e12)],
  );

  static const Color texturesGoldTexture2 = Color(0xffb99f6e);

  static const Color texturesHeadersTexture = Color(0xff184b46);
}
