import 'package:design_app/scr/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Container(
            width: screenSize.width * 0.75,
            height: screenSize.height * 0.75,
            child: Column(
              children: <Widget>[Expanded(child: _Slides()), _Dots()],
            ),
          ),
        ),
        // child:
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_Dot(index: 0), _Dot(index: 1), _Dot(index: 2)],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({required this.index});
  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 20,
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: (index <= (pageIndex + 0.4) && index >= (pageIndex - 0.4) ) ? Colors.red  : Colors.grey, 
        shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // print('Page: ${pageViewController.page}');
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: <Widget>[
          _Slide(svg: 'assets/svgs/phone1.svg'),
          _Slide(svg: 'assets/svgs/phone2.svg'),
          _Slide(svg: 'assets/svgs/phone3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide({required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10),
      child: SvgPicture.asset(svg),
    );
  }
}

// class SlideShowPage extends StatelessWidget {
//   const SlideShowPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<String>(
//           future: cambiarColorSvg(context, 'assets/svgs/phone1.svg', '#F50057', '#0000FF'),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return CircularProgressIndicator();
//             }

//             return SvgPicture.string(
//               snapshot.data!,
//               semanticsLabel: 'Phone 1',
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Future<String> cambiarColorSvg(BuildContext context, String path, String original, String nuevo) async {
//     final rawSvg = await DefaultAssetBundle.of(context).loadString(path);
//     print(rawSvg);
//     return rawSvg.replaceAll(original, nuevo);
//   }
// }
