import 'package:flutter/material.dart';

import 'list_data.dart';

class AnimatedListView extends StatelessWidget {
  AnimatedListView({super.key, required this.listSlidePosition});

  final Animation<EdgeInsets> listSlidePosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListData(
            title: 'Faculdade',
            subtitle: 'Exercicios de POO',
            image: const AssetImage('assets/perfil.jpg'),
            margin: listSlidePosition.value * 3),
        ListData(
            title: 'Jogar basquete',
            subtitle: 'Treino de arremessos',
            image: const AssetImage('assets/perfil.jpg'),
            margin: listSlidePosition.value * 2),
        ListData(
          title: 'Estudar Flutter',
          subtitle: 'Com o curso do Daniel Ciolfi',
          image: const AssetImage('assets/perfil.jpg'),
          // o valor vai multiplicando os valores da margem
          margin: listSlidePosition.value * 1,
        ),
        ListData(
            title: 'Academia',
            subtitle: 'Treino de biceps',
            image: const AssetImage('assets/perfil.jpg'),
            margin: listSlidePosition.value * 0),
      ],
    );
  }
}
