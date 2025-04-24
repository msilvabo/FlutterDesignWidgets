import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final double size;
  final bool pointUp;
  final Color primarycolor;
  final Color secondcolor;
  const Slideshow({
    super.key,
    required this.slides,
    required this.size,
    this.pointUp = false,
    required this.primarycolor,
    required this.secondcolor,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderShowModel(),
      child: SafeArea(
        child: Center(
          child: Container(
            width: size,
            height: size,
            child: Builder(
              builder: (context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Provider.of<SliderShowModel>(context, listen: false)
                      .primarycolor = primarycolor;
                  Provider.of<SliderShowModel>(context, listen: false)
                      .primarycolor = secondcolor;
                });
                return Column(
                  children: <Widget>[
                    if (pointUp)
                      _Dots(
                        cnt: slides.length,
                        primarycolor: primarycolor,
                        secondcolor: secondcolor,
                      ),
                    Expanded(child: _Slides(listSlides: slides)),
                    if (!pointUp)
                      _Dots(
                        cnt: slides.length,
                        primarycolor: primarycolor,
                        secondcolor: secondcolor,
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int cnt;
  final Color primarycolor;
  final Color secondcolor;

  const _Dots({
    required this.cnt,
    required this.primarycolor,
    required this.secondcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          cnt, //list.length,
          (index) => _Dot(
            index: index,
            primarycolor: primarycolor,
            secondcolor: secondcolor,
          ),
        ),
        // children: <Widget>[_Dot(index: 0), _Dot(index: 1), _Dot(index: 2)],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color primarycolor;
  final Color secondcolor;

  const _Dot({
    required this.index,
    required this.primarycolor,
    required this.secondcolor,
  });
  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<SliderShowModel>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 20,
      height: 20,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color:
            (index <= (ssModel.currentPage + 0.4) &&
                    index >= (ssModel.currentPage - 0.4))
                ? ssModel._primaryColor
                : ssModel._secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> listSlides;
  const _Slides({required this.listSlides});
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<SliderShowModel>(context, listen: false).currentPage =
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
    // widget.listSvgs.forEach((element) {
    //   list.add(_Slide(svg: element));
    // });
    return Container(
      child: PageView(
        controller: pageViewController,
        children: List.generate(widget.listSlides.length, (index) {
          return _Slide(svg: widget.listSlides[index]);
        }),
        // children: <Widget>[
        //   _Slide(svg: 'assets/svgs/phone1.svg'),
        //   _Slide(svg: 'assets/svgs/phone2.svg'),
        //   _Slide(svg: 'assets/svgs/phone3.svg'),
        // ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget svg;
  const _Slide({required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10),
      child: svg,
    );
  }
}

class SliderShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.red;
  Color _secondaryColor = Colors.grey;

  double get currentPage => _currentPage;

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  Color get primarycolor => _primaryColor;
  Color get secondarycolor => _secondaryColor;

  set primarycolor(Color value) {
    _primaryColor = value;
    notifyListeners();
  }

  set secondarycolor(Color value) {
    _secondaryColor = value;
    notifyListeners();
  }
}
