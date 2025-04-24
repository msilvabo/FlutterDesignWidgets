import 'package:design_app/scr/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Widget> slides = [
      SvgPicture.asset('assets/svgs/phone1.svg'),
      SvgPicture.asset('assets/svgs/phone2.svg'),
      SvgPicture.asset('assets/svgs/phone3.svg'),
      SvgPicture.asset('assets/svgs/phone4.svg'),
      SvgPicture.asset('assets/svgs/phone5.svg'),
    ];
    return Scaffold(
      body: Center(
        child: Slideshow(
          slides: slides,
          size: 600,
          pointUp: false,
          primarycolor: Colors.red,
          secondcolor: Colors.black54,
          )));
  }
}
