import 'package:design_app/scr/theme/theme.dart';
import 'package:design_app/scr/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final darkTheme = Provider.of<ThemeChanger>(context).darkTheme;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Slideshow(
                slides: slides,
                size: 600,
                pointUp: false,
                primarycolor: darkTheme ? Colors.red : appTheme.primaryColor,
                secondcolor: Colors.grey,
                primaryBullet: 15,
                secondaryBullet: 5,
                ),
            ),
            Expanded(
              child: Slideshow(
                slides: slides,
                size: 600,
                pointUp: false,
                primarycolor: Colors.green,
                secondcolor: Colors.grey,
                primaryBullet: 25,
                secondaryBullet: 15,
                ),
            ),
          ],
        )));
  }
}
