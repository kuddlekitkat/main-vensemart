import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/custom_button.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';
import 'package:vensemart/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  TextEditingController groupElevenController = TextEditingController();

  TextEditingController groupTenController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: size.width,
                    padding: getPadding(left: 19, right: 19),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomIconButton(
                              height: 29,
                              width: 34,
                              margin: getMargin(left: 1),
                              onTap: () {
                                onTapBtnArrowleft(context);
                              },
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgArrowleftBlueA700)),
                          Spacer(),
                          Container(
                              width: getHorizontalSize(229.00),
                              child: Text("Reset\nPassword ?",
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold40)),
                          CustomTextFormField(
                              width: 350,
                              focusNode: FocusNode(),
                              controller: groupElevenController,
                              hintText: "New Password",
                              margin: getMargin(top: 36),
                              variant: TextFormFieldVariant.OutlineBlue900,
                              shape: TextFormFieldShape.RoundedBorder10,
                              padding: TextFormFieldPadding.PaddingAll15,
                              fontStyle: TextFormFieldFontStyle.SoraRegular14,
                              textInputType: TextInputType.visiblePassword,
                              isObscureText: true),
                          CustomTextFormField(
                              width: 350,
                              focusNode: FocusNode(),
                              controller: groupTenController,
                              hintText: "Confirm Password",
                              margin: getMargin(top: 31),
                              variant: TextFormFieldVariant.OutlineBlue900,
                              shape: TextFormFieldShape.RoundedBorder10,
                              padding: TextFormFieldPadding.PaddingAll15,
                              fontStyle: TextFormFieldFontStyle.SoraRegular14,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              isObscureText: true),
                          CustomButton(
                              height: 50,
                              width: 350,
                              text: "Continue",
                              margin: getMargin(top: 52, bottom: 200),
                              padding: ButtonPadding.PaddingAll14,
                              fontStyle: ButtonFontStyle.RubikRomanMedium17)
                        ])))));
  }

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
