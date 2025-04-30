import 'dart:math';

import 'package:design_app/scr/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinteresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => _PinteresPageModel(),
        child: Stack(children: [PinteresGrid(), _MenuLocation()]),
      ),
      // body: PinteresGrid()
      // body: PinterestMenu()
    );
  }
}

class _MenuLocation extends StatelessWidget {
  const _MenuLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_PinteresPageModel>(context).visible;

    final List<PinterestButton> items = [
      PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print('pie_chart');
        },
      ),
      PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print('search');
        },
      ),
      PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print('notifications');
        },
      ),
      PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('supervised_user_circle');
        },
      ),
    ];
    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: widthScreen,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: PinterestMenu(
            mostrar: mostrar,
            backgroundColor: Colors.white,
            activeColor: Colors.black,
            inactiveColor: Colors.blueGrey,
            items: items,
            ),
        ),
      ),
    );
  }
}

class PinteresGrid extends StatefulWidget {
  const PinteresGrid({super.key});

  @override
  State<PinteresGrid> createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
  final items = List<int>.generate(200, (index) => index);
  final ScrollController _scrollController = ScrollController();
  double scrollBefore = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset > scrollBefore) {
        scrollBefore = _scrollController.offset;
        Provider.of<_PinteresPageModel>(context, listen: false).visible = false;
      } else {
        scrollBefore = _scrollController.offset;
        Provider.of<_PinteresPageModel>(context, listen: false).visible = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: _scrollController,
      crossAxisCount: 3,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final double randomHeight = Random().nextInt(100) + 150;
        return _PinteresItem(randomHeight: randomHeight, index: items[index]);
      },
    );
  }
}

class _PinteresItem extends StatelessWidget {
  const _PinteresItem({
    super.key,
    required this.randomHeight,
    required this.index,
  });

  final double randomHeight;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(index);
        Provider.of<_PinteresPageModel>(context, listen: false).visible = true;
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: randomHeight,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ),
      ),
    );
  }
}

class _PinteresPageModel with ChangeNotifier {
  bool _visible = false;

  bool get visible => _visible;

  set visible(bool state) {
    _visible = state;
    notifyListeners();
  }
}
