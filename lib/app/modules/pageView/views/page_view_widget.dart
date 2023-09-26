import 'package:curve_app/app/core/app_media_query.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';

class PageViewWidget extends StatelessWidget {
  String image;
  String title ;
  String subTitle ;

  PageViewWidget({super.key, required this.image , required this.title ,
  required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(image),
          width: widthMediaQuery(width: 0.9, context: context),
          height: heightMediaQuery(height: 0.3, context: context),
          fit: BoxFit.fill,
        ),
         Text(
          title,
          style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 25,
              fontFamily: AppStrings.fontFamilyBold,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: heightMediaQuery(
              height: 0.02, context: context),
        ),
         Text(
          subTitle,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontSize: 16,
            fontFamily: AppStrings.fontFamilyMedium,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
