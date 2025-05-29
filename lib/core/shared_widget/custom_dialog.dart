import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/shared_widget/custom_button.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class CustomDialog extends StatelessWidget {
  final BuildContext parentContext; 
  final double? height;
  final double? width;
  final String title;
  final String? subtitle;
  final String buttonText;
  final double buttonpaddingHorizontal;
  final double buttonpaddingVertical;
  final String iconPath;
  final void Function()? onPressed;
  final Color iconColor;

  const CustomDialog({
    super.key,
    required this.parentContext,
    this.height,
    this.width,
    required this.title,
    this.subtitle,
    required this.buttonText,
    this.onPressed,
    required this.iconPath,
    required this.iconColor, required this.buttonpaddingHorizontal, required this.buttonpaddingVertical,
  });
@override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10.0,
      child: Container(
        height: height ?? 305,
        width: width ?? 361,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.colorsBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                height: 108,
                width: 108,
                color: iconColor,
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: subtitle != null
                    ? AppTextStyles.bodyL(context).copyWith(
                    color: AppColors.colorsPrimary2,)
                    : AppTextStyles.bodyL(context).copyWith(color: AppColors.greyScaleAlmostBlack),
                textAlign: TextAlign.center,
              ),
              if (subtitle != null) ...[
                SizedBox(
                  height: 4,
                ),
                Text(
                  subtitle!,
                  style: AppTextStyles.bodyM(context).copyWith(
                    color: AppColors.colorsPrimary2,)
                      ,
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(height: 20),
              CustomButton(
              
                labelName: buttonText,
                onPressed: onPressed ??
                    () {
                      Navigator.pop(parentContext);
                    },
           
              ),
            ],
          ),
        ),
      ),
    );
  }
}