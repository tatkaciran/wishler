import 'package:flutter/material.dart';
import 'package:wishler/src/core/core.dart';

class WishlerScaffold extends StatelessWidget {
  const WishlerScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.screenHeight.percent(7),
          horizontal: context.screenHeight.percent(5),
        ),
        child: ScaffoldDecoratedBox(
          child: Padding(
            padding: EdgeInsets.only(left: context.screenHeight.percent(15)),
            child: ScaffoldDecoratedBox(
              color: Colors.white,
              child: const Center(
                child: Text('scaffold'),
              ),
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
    super.key,
    Color? color,
    double? radius,
  }) : super(
          decoration: BoxDecoration(
            color: color ?? Color.fromARGB(255, 232, 239, 242),
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
        );
}
