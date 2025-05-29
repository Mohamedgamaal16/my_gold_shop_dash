import 'package:flutter/material.dart';
import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';
class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.labelName,
    this.onPressed,
    this.height = 45,
    this.width = double.infinity,
    this.isPrimary = true,
    this.child,
  });

  final String? labelName;
  final Widget? child;
  final void Function()? onPressed;
  final bool isPrimary;
  final double height, width;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final buttonChild = FittedBox(
      fit: BoxFit.scaleDown,
      child:
          widget.labelName == null
              ? widget.child!
              : Text(
                widget.labelName!,
                style: AppTextStyles.buttonM(context).copyWith(
                  color:
                      widget.isPrimary
                          ? AppColors.colorsSurface
                          : AppColors.colorsPrimary2,
                ),
                textAlign: TextAlign.center,
              ),
    );

    final button = ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            widget.isPrimary ? Colors.transparent : AppColors.colorsSurface,
        shadowColor: Colors.transparent,

        // padding: const EdgeInsets.all(10),
        minimumSize: Size(widget.width, widget.height),
        maximumSize: Size(widget.width, widget.height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side:
              widget.isPrimary
                  ? BorderSide.none
                  : const BorderSide(
                    width: 1,
                    color: AppColors.greyScaleMediumGrey,
                  ),
        ),
      ),
      child: buttonChild,
    );

    if (widget.isPrimary) {
      return Container(
        decoration: BoxDecoration(
          gradient: AppColors.texturesButtonTexture,

          borderRadius: BorderRadius.circular(6),
        ),
        child: button,
      );
    } else {
      return button;
    }
  }
}
