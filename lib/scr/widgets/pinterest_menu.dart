import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  
  const PinterestMenu({
    super.key,
    required this.mostrar,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: mostrar ? 1 : 0,
        child: Builder(
          builder: (context) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Provider.of<_MenuModel>(context, listen: false).backgroundColor =
                  backgroundColor;
              Provider.of<_MenuModel>(context, listen: false).activeColor =
                  activeColor;
              Provider.of<_MenuModel>(context, listen: false).inactiveColor =
                  inactiveColor;
            });
            return _PinteresMenuBackground(child: _MenuItems(items: items));
          },
        ),
      ),
    );
  }
}

class _PinteresMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinteresMenuBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      height: 70,
      width: 400,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;
  const _MenuItems({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        items.length,
        (index) => _PinterestMenuButton(index: index, item: items[index]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({
    required this.index,
    required this.item,
  });
  @override
  Widget build(BuildContext context) {
    final itemSelect = Provider.of<_MenuModel>(context).itemSelect;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelect = index;
        item.onPressed();
      },
      child: Icon(
        item.icon,
        size: (itemSelect == index) ? 40 : 25,
        color: (itemSelect == index) ? activeColor : inactiveColor,
      ),
    );
  }
}

class PinterestButton {
  final IconData icon;
  final Function onPressed;

  PinterestButton({required this.onPressed, required this.icon});
}

class _MenuModel with ChangeNotifier {
  int _indexSelect = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  Color get backgroundColor => _backgroundColor;
  Color get activeColor => _activeColor;
  Color get inactiveColor => _inactiveColor;

  set backgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }

  set activeColor(Color color) {
    _activeColor = color;
    notifyListeners();
  }

  set inactiveColor(Color color) {
    _inactiveColor = color;
    notifyListeners();
  }

  int get itemSelect => _indexSelect;

  set itemSelect(int value) {
    _indexSelect = value;
    notifyListeners();
  }
}
