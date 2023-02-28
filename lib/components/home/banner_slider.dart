import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("assets/images/lisa_banner1.jpg"),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("assets/images/lisa_banner2.jpg"),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("assets/images/lisa_banner3.jpg"),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset("assets/images/lisa_banner4.jpg"),
        ),
      ],
    );
  }
}
