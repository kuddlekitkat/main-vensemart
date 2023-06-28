import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/custom_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactUsScreen extends StatelessWidget {


  void sendEmail(String email) async {
    final Uri mailtoUrl = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(mailtoUrl)) {
      await launchUrl(mailtoUrl);
    } else {
      throw Exception('Could not launch $mailtoUrl');
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: size.width,
                          padding: getPadding(
                              left: 20, top: 15, right: 20, bottom: 15),
                          decoration: AppDecoration.fillBlueA700,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomIconButton(
                                    height: 34,
                                    width: 34,
                                    margin: getMargin(top: 9),
                                    variant: IconButtonVariant.FillGray50,
                                    alignment: Alignment.centerLeft,
                                    onTap: () {
                                      onTapBtnArrowleft(context);
                                    },
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgArrowleft)),
                                CustomImageView(
                                    imagePath: ImageConstant.imgImage32,
                                    height: getSize(228.00),
                                    width: getSize(228.00),
                                    margin: getMargin(top: 3)),
                                Container(
                                    width: getHorizontalSize(328.00),
                                    margin: getMargin(top: 4),
                                    child: Text(
                                        "For enquiries and complains Kindly reach out to us \n through any of the  contactinformation below",
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtPoppinsMedium13))
                              ])),
                      TextButton(
                        onPressed: (){

             FlutterPhoneDirectCaller.callNumber(
                       '+2348167131445');

                        },
                        child: Padding(
                            padding: getPadding(top: 36),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCall,
                                      height: getSize(20.00),
                                      width: getSize(20.00),
                                      margin: getMargin(bottom: 5)),
                                  Padding(
                                      padding: getPadding(left: 7),
                                      child: Text("Call us",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsSemiBold15BlueA700,
                                      ))
                                ])),
                      ),
                      TextButton(
                        onPressed: (){
    FlutterPhoneDirectCaller.callNumber(
    '+2348167131445');

                        },
                        child: Padding(
                            padding: getPadding(top: 3),
                            child: Text("+2348167131445",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium13Black900)),
                      ),
                      TextButton(
                        onPressed: (){
                          sendEmail('info@vensemart.com');
                        },
                        child: Padding(
                            padding: getPadding(top: 27),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgMail,
                                      height: getVerticalSize(12.00),
                                      width: getHorizontalSize(15.00),
                                      margin: getMargin(top: 4, bottom: 3)),
                                  Padding(
                                      padding: getPadding(left: 8),
                                      child: Text("Email us",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsSemiBold13))
                                ])),
                      ),
                      TextButton(
                        onPressed: (){
                          sendEmail('info@vensemart.com');

                        },
                        child: Padding(
                            padding: getPadding(top: 5),
                            child: Text("info@vensemart.com",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium13Black900)),
                      ),
                      // Padding(
                      //     padding: getPadding(top: 28),
                      //     child: Text("Message us on",
                      //         overflow: TextOverflow.ellipsis,
                      //         textAlign: TextAlign.left,
                      //         style: AppStyle.txtPoppinsMedium13BlueA700)),
                      // CustomImageView(
                      //     imagePath: ImageConstant.imgLogoswhatsappicon,
                      //     height: getSize(28.00),
                      //     width: getSize(28.00),
                      //     margin: getMargin(top: 10, bottom: 5))
                    ]))));
  }

  onTapBtnArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
