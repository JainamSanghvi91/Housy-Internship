import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:housytask/size_config.dart';
import 'package:lottie/lottie.dart';

class SplasScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController();
    return LayoutBuilder(builder: (context, snapshot) {
      SizeConfig().init(snapshot);
      var maxH = snapshot.maxHeight;
      var maxW = snapshot.maxWidth;
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Lottie.asset(
                'assets/lottie/scan-products.json',
                controller: animationController,
                onLoaded: (composition) {
                  animationController
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "Please Wait! Application is almost ready!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
