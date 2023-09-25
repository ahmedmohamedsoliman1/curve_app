import 'package:curve_app/app/core/app_media_query.dart';
import 'package:flutter/cupertino.dart';

class PageViewWidget extends StatelessWidget {
  String image;

  PageViewWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(image),
          width: widthMediaQuery(width: 0.9, context: context),
          height: heightMediaQuery(height: 0.3, context: context),
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
