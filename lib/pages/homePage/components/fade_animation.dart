import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({super.key, required this.fadeAnimation});
  
  final Animation<Color?> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    // para obter o efeito de transição, precisamos de um widget que tenha a propriedade de cor
    // e colocar a mesma tag que foi passada para o Hero da página anterior
    return Hero(tag: "fade",
     child: Container(
      decoration: BoxDecoration(
        color: fadeAnimation.value,
      ),
    ));
  }
}