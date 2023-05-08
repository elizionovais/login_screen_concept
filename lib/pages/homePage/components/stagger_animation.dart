import 'package:flutter/material.dart';

import 'animated_list_view.dart';
import 'fade_animation.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({super.key, required this.controller})
      : containerGrow = CurvedAnimation(
            //como queremos somente de 0 a 1, usamos o intervalo do controller
            parent: controller,
            curve: Curves.ease),
        listSlidePosition =
            EdgeInsetsTween(begin: const EdgeInsets.only(bottom: 0), end: const EdgeInsets.only(bottom: 80))
                .animate(CurvedAnimation(parent: controller, curve: const Interval(0.325, 0.8, curve: Curves.ease))),
        fadeAnimation = ColorTween(begin: Colors.yellow, end: Colors.transparent)
            .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

  AnimationController controller;

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color?> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(animation: controller, builder: buildAnimation),
      ),
    );
  }

  Widget buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            HomeTop(
              containerGrow: containerGrow,
            ),
            AnimatedListView(
              listSlidePosition: listSlidePosition,
            )
          ],
        ),
        // o IgnorePointer é um widget que impede que o usuario interaja com os widgets abaixo dele
        IgnorePointer(child: FadeAnimation(fadeAnimation: fadeAnimation))
      ],
    );
  }
}
