import '../choose_address_screen/widgets/choose_address_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/app_bar/appbar_iconbutton.dart';
import 'package:vensemart/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:vensemart/widgets/app_bar/custom_app_bar.dart';
import 'package:vensemart/widgets/custom_button.dart';

class ChooseAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 54,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 20, top: 11, bottom: 11),
                    onTap: () => onTapArrowleft5(context)),
                centerTitle: true,
                title: AppbarSubtitle2(text: "Chose Address")),
            body: Container(
                width: size.width,
                padding: getPadding(top: 14, bottom: 14),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: getPadding(left: 18, top: 21, right: 21),
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(16.00));
                              },
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return ChooseAddressItemWidget();
                              })),
                      Spacer()
                    ])),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 113, right: 113, bottom: 32),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomButton(
                      height: 48,
                      width: 164,
                      text: "Add Location",
                      fontStyle: ButtonFontStyle.PoppinsMedium14,
                      onTap: () => onTapAddlocation(context))
                ]))));
  }

  onTapAddlocation(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addNewAddressScreen);
  }

  onTapArrowleft5(BuildContext context) {
    Navigator.pop(context);
  }
}
