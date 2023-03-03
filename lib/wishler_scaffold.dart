import 'package:flutter/material.dart';
import 'package:wishler/src/core/core.dart';

class WishlerScaffold extends StatelessWidget {
  const WishlerScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldDecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 230, 237, 240),
              Color.fromARGB(255, 241, 246, 248),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.screenHeight.percent(5),
            horizontal: context.screenWidth.percent(3),
          ),
          child: Stack(
            children: [
              ScaffoldDecoratedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: ScaffoldDecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text('scaffold'),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Spacer(),
                  ExpandableTab(icon: Icons.home, label: 'Home'),
                  ExpandableTab(icon: Icons.category, label: 'Categories'),
                  ExpandableTab(icon: Icons.favorite, label: 'favorites'),
                  ExpandableTab(icon: Icons.star_border, label: 'New Arrivals'),
                  ExpandableTab(icon: Icons.message, label: 'Messages'),
                  ExpandableTab(icon: Icons.shopping_bag, label: 'Cart'),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableTab extends StatefulWidget {
  final IconData icon;
  final String label;
  const ExpandableTab({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  State<ExpandableTab> createState() => _ExpandableTabState();
}

class _ExpandableTabState extends State<ExpandableTab> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    const Duration duration = Duration(milliseconds: 180);
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isExpanded = true;
        });
        print('onEnter');
      },
      onExit: (event) {
        setState(() {
          isExpanded = false;
        });
        print('onExit');
      },
      child: ScaffoldDecoratedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AnimatedCrossFade(
                    firstChild: Icon(widget.icon),
                    secondChild: Icon(widget.icon),
                    crossFadeState: !isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: duration),
                SizedBox(width: 10),
                AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: Text(widget.label),
                    crossFadeState: !isExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: duration),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScaffoldDecoratedBox extends DecoratedBox {
  ScaffoldDecoratedBox({
    required super.child,
    Decoration? decoration,
    super.key,
    Color? color,
    double? radius,
  }) : super(
          decoration: decoration ??
              BoxDecoration(
                color: color ?? const Color.fromARGB(255, 241, 246, 248),
                borderRadius: BorderRadius.circular(radius ?? 15),
              ),
        );
}
