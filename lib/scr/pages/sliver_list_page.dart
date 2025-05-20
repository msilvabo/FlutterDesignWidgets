import 'package:design_app/scr/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Titulo(),
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(bottom: -10, right: 0, child: _BotonNewList()),
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    return SizedBox(
      width: size.width * 0.8,
      height: 100,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              (appTheme.darkTheme)
                  ? appTheme.currentTheme.primaryColor
                  : Color(0xffED6762),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem(1, 'Orange', Color(0xffF08F66)),
    _ListItem(2, 'Family', Color(0xffF2A38A)),
    _ListItem(3, 'Subscriptions', Color(0xffF7CDD5)),
    _ListItem(4, 'Books', Color(0xffFCEBAF)),
    _ListItem(5, 'Orange', Color(0xffF08F66)),
    _ListItem(6, 'Family', Color(0xffF2A38A)),
    _ListItem(7, 'Subscriptions', Color(0xffF7CDD5)),
    _ListItem(8, 'Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHederDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              color: appTheme.scaffoldBackgroundColor,
              alignment: Alignment.centerLeft,
              child: _Titulo(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([...items, SizedBox(height: 130)]),
        ),
      ],
    );
  }
}

class _SliverCustomHederDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHederDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHederDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'New',
              style: TextStyle(
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
                fontSize: 50
                ),
            ),
          ),
          Stack(
            children: <Widget>[
              SizedBox(width: 100),
              Positioned(
                bottom: 12,
                child: Container(
                  width: 120,
                  height: 8,
                  color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
                ),
              ),
              Text(
                'List',
                style: TextStyle(
                  color: (appTheme.darkTheme) ? appTheme.currentTheme.primaryColor : Colors.red,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListTask extends StatelessWidget {
  ListTask({super.key});
  final items = [
    _ListItem(1, 'Orange', Color(0xffF08F66)),
    _ListItem(2, 'Family', Color(0xffF2A38A)),
    _ListItem(3, 'Subscriptions', Color(0xffF7CDD5)),
    _ListItem(4, 'Books', Color(0xffFCEBAF)),
    _ListItem(5, 'Orange', Color(0xffF08F66)),
    _ListItem(6, 'Family', Color(0xffF2A38A)),
    _ListItem(7, 'Subscriptions', Color(0xffF7CDD5)),
    _ListItem(8, 'Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final int index;
  final String colorText;
  final Color color;
  const _ListItem(this.index, this.colorText, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      height: 130,
      width: 100,
      margin: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Color.lerp(appTheme.currentTheme.primaryColor, color, 0.6) : color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$index - $colorText ',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
