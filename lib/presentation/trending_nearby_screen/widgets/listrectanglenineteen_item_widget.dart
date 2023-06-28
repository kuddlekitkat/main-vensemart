import 'package:flutter/material.dart';
import 'package:vensemart/core/app_export.dart';
import 'package:vensemart/widgets/custom_button.dart';

// ignore: must_be_immutable
class ListrectanglenineteenItemWidget extends StatelessWidget {
  ListrectanglenineteenItemWidget(
      {this.onTapImgRectangleNineteen, this.onTapBooknow});

  VoidCallback? onTapImgRectangleNineteen;

  VoidCallback? onTapBooknow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle15,
            height: getSize(
              109,
            ),
            width: getSize(
              109,
            ),
            radius: BorderRadius.only(
              topLeft: Radius.circular(
                getHorizontalSize(
                  5,
                ),
              ),
              bottomLeft: Radius.circular(
                getHorizontalSize(
                  5,
                ),
              ),
            ),
            onTap: () {
              onTapImgRectangleNineteen?.call();
            },
          ),
          Padding(
            padding: getPadding(
              left: 10,
              top: 8,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Amarachi",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSoraRegular15,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 5,
                          ),
                          child: Text(
                            "Hair cut",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSoraLight10,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: getPadding(
                        left: 78,
                        top: 5,
                        bottom: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Jobs completed",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular82,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "14",
                                  style: TextStyle(
                                    color: ColorConstant.black9007f,
                                    fontSize: getFontSize(
                                      10,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                    color: ColorConstant.blueA700,
                                    fontSize: getFontSize(
                                      12,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: getPadding(
                    top: 8,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgLocationPink40010x10,
                        height: getSize(
                          10,
                        ),
                        width: getSize(
                          10,
                        ),
                        margin: getMargin(
                          bottom: 1,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 1,
                        ),
                        child: Text(
                          "Abuja Area 11",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSoraLight8,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 4,
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgGroup5,
                        height: getVerticalSize(
                          8,
                        ),
                        width: getHorizontalSize(
                          44,
                        ),
                        margin: getMargin(
                          top: 7,
                          bottom: 7,
                        ),
                      ),
                      CustomButton(
                        height: getVerticalSize(
                          22,
                        ),
                        width: getHorizontalSize(
                          66,
                        ),
                        text: "Book Now",
                        margin: getMargin(
                          left: 104,
                        ),
                        shape: ButtonShape.CircleBorder15,
                        fontStyle: ButtonFontStyle.PoppinsMedium14,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
