import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/custom_button.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';
import 'package:vensemart/widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
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
                              child: Text("Forgot\nPassword ?",
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold40)),
                          Container(
                              width: getHorizontalSize(262.00),
                              margin: getMargin(top: 26),
                              child: Text(
                                  "Please enter the email or phone number\nregistered with your account",
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular13)),
                          CustomTextFormField(
                              width: 350,
                              focusNode: FocusNode(),
                              controller: groupTenController,
                              hintText: "Email ID / Mobile Number",
                              margin: getMargin(top: 19),
                              variant: TextFormFieldVariant.OutlineBlue900,
                              shape: TextFormFieldShape.RoundedBorder10,
                              padding: TextFormFieldPadding.PaddingAll15,
                              fontStyle: TextFormFieldFontStyle.SoraRegular14,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress),
                          CustomButton(
                              height: 50,
                              width: 350,
                              text: "Reset password",
                              margin: getMargin(top: 52, bottom: 200),
                              fontStyle: ButtonFontStyle.RubikRomanMedium17)
                        ])))));
  }

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
