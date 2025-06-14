import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:my_gold_dashboard/core/styles/colors.dart';
import 'package:my_gold_dashboard/core/styles/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool haveBorder;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double borderRadius;
  final double height;
  final double width;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTab;
  final int? textFieldLength; // Property for optional length checking
final Color backColor;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.haveBorder = true,
    this.borderRadius = 8,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.prefixIcon,
    this.height = 56,
    this.width = double.infinity,
    this.controller,
    this.onChanged,
    this.onTab,
    this.textFieldLength,  this.backColor =  AppColors.colorsSurface,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late TextEditingController _controller;
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _controller = widget.controller ?? TextEditingController();
    _currentLength = _controller.text.length;

    // Add listener to track text length if textFieldLength is provided
    if (widget.textFieldLength != null) {
      _controller.addListener(_updateTextLength);
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else if (widget.textFieldLength != null) {
      _controller.removeListener(_updateTextLength);
    }
    super.dispose();
  }

  void _updateTextLength() {
    setState(() {
      _currentLength = _controller.text.length;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authOutlineInputBorder =
        widget.haveBorder
            ? OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.greyScaleMediumGrey,
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            )
            : InputBorder.none;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: widget.height,
            maxHeight: widget.height,
            maxWidth: widget.width,
          ),
          child: TextFormField(
            controller: _controller,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            obscureText: _obscureText,
            keyboardType:
                widget.isPhoneNumber
                    ? TextInputType.number
                    : TextInputType.multiline,
            inputFormatters: [
              if (widget.textFieldLength != null)
                LengthLimitingTextInputFormatter(widget.textFieldLength!),
              if (widget.isPhoneNumber) FilteringTextInputFormatter.digitsOnly,
            ],
            style: AppTextStyles.caption(context).copyWith(
              color:
                  widget.onTab != null
                      ? AppColors.greyScaleDarkGrey
                      : AppColors.greyScaleAlmostBlack,
            ),
            decoration: InputDecoration(
              fillColor:
                  widget.onTab != null
                      ? AppColors.greyScaleDarkGrey
                      :widget. backColor,
              filled: true,
              hintText: widget.hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: AppTextStyles.bodyS(context).copyWith(
                color:
                    widget.onTab != null
                        ? AppColors.colorsSurface
                        : AppColors.greyScaleMediumGrey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              suffixIcon:
                  widget.isPassword
                      ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.colorsSurface,
                        ),
                        onPressed: _togglePasswordVisibility,
                      )
                      : widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              disabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(
                  color: AppColors.greyScaleMediumGrey,
                ),
              ),
              // No counter text in the decoration
              counterText: '',
            ),
            readOnly: widget.onTab != null,
            validator:
                widget.validator ??
                (widget.textFieldLength != null
                    ? (value) {
                      if (value != null &&
                          value.length > widget.textFieldLength!) {
                        return 'Input exceeds maximum length of ${widget.textFieldLength}';
                      }
                      return null;
                    }
                    : null),
            onSaved: widget.onSaved,
            onTap: widget.onTab,
            // Hide the default counter
            buildCounter:
                (
                  context, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) => null,
          ),
        ),
        // Add character counter below the text field only if textFieldLength is provided
        if (widget.textFieldLength != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 8.0),
            child: Text(
              '$_currentLength/${widget.textFieldLength}',
              style: AppTextStyles.bodyM(context).copyWith(
                color:
                    _currentLength >= (widget.textFieldLength ?? 0)
                        ? Colors.red
                        : AppColors.greyScaleMediumGrey,
              ),
            ),
          ),
      ],
    );
  }
}
