import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen_lock/theme/theme_pallets/dark_pallete.dart';
import 'package:screen_lock/tokens/spacing.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key, required this.onPressed});

  final VoidCallback onPressed;

  static const flex = 3;
  static const fontSize = 30.0;
  static const imageSize = 180.0;
  static const buttonWidth = 339.0;
  static const buttonHeight = 52.0;
  static const borderRadius = 10.0;
  static const smallFontSize = 16.0;
  static const mediumFontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkPalette.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: flex),
            SvgPicture.asset("assets/no_connection.svg", width: imageSize, height: imageSize),
            const SizedBox(height: Spacing.averageSpacer),
            Text(
              'WHOOPS!',
              style: TextStyle(
                color: DarkPalette.whiteColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: Spacing.bigSpacer),
            Text(
              'Slow or no internet connection',
              style: TextStyle(
                color: DarkPalette.whiteColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacing.averageSpacer),
            Text(
              'Check your internet settings and try again',
              style: TextStyle(
                color: DarkPalette.whiteColor,
                fontSize: smallFontSize,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spacing.upperSpacer),
            SizedBox(
              height: buttonHeight,
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DarkPalette.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                child: Text(
                  'Try again',
                  style: TextStyle(
                    color: DarkPalette.whiteColor,
                    fontSize: mediumFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Spacer(flex: flex),
          ],
        ),
      ),
    );
  }
}
