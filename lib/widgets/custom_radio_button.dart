import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {this.shape,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onChange,
      this.isRightCheck = false,
      this.iconSize,
      this.value,
      this.groupValue,
      this.text,
      this.width});

  RadioShape? shape;

  RadioVariant? variant;

  RadioFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  Function(String)? onChange;

  bool? isRightCheck;

  double? iconSize;

  String? value;

  String? groupValue;

  String? text;

  double? width;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildRadioButtonWidget(),
          )
        : _buildRadioButtonWidget();
  }

  _buildRadioButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onChange!(value!);
        },
        child: Container(
          width: width,
          decoration: _buildDecoration(),
          child: isRightCheck! ? getRightSideRadio() : getLeftSideRadio(),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  Widget getRightSideRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getTextWidget(),
        getRadioWidget(),
      ],
    );
  }

  Widget getLeftSideRadio() {
    return Row(
      children: [
        getRadioWidget(),
        Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: getTextWidget(),
        ),
      ],
    );
  }

  Widget getTextWidget() {
    return Text(
      text ?? "",
      textAlign: TextAlign.center,
      style: _setFontStyle(),
    );
  }

  Widget getRadioWidget() {
    return SizedBox(
      height: getVerticalSize(iconSize ?? 0),
      width: getHorizontalSize(iconSize ?? 0),
      child: Radio<String>(
        value: value ?? "",
        groupValue: groupValue,
        onChanged: (value) {
          onChange!(value!);
        },
      ),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            9,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setBorder() {
    switch (variant) {
      case RadioVariant.OutlineBlue900:
        return Border.all(
          color: ColorConstant.blue900,
          width: getHorizontalSize(
            1.00,
          ),
        );
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case RadioShape.CircleBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      default:
        return null;
    }
  }
}

enum RadioShape {
  CircleBorder8,
}

enum RadioVariant {
  OutlineBlue900,
}

enum RadioFontStyle {
  PoppinsRegular9,
}
