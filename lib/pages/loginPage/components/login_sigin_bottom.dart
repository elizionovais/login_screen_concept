import 'package:flutter/material.dart';

class AnimateddBottom extends StatelessWidget {
  // as animações sao inicializadas no construtor, apos os parametros obrigatorios colocamos os opcionais
  AnimateddBottom({super.key, required this.animationController})
      :
        // Inicializando as animações
        squeezeBottom = Tween<double>(begin: 320, end: 60).animate(
          CurvedAnimation(
            // parent: é o controller que controla a animação
            parent: animationController,
            curve: const Interval(0.0, 0.150),
          ),
        ),
        zoomOut = Tween<double>(begin: 60.0, end: 1000.0).animate(
          CurvedAnimation(
            parent: animationController,
            // o interval defini o intervalo de tempo que a animação vai ser executada
            //quando queremos declarar um intervalo e uma curva, usamos o metodo curve desse modo:
            curve: const Interval(0.550, 0.999, curve: Curves.bounceOut),
          ),
        );

  AnimationController animationController;

  //declarando as animações
  final Animation<double> squeezeBottom;
  final Animation<double> zoomOut;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Center(
          child: InkWell(
            onTap: () {
              animationController.forward();
            },
            // Hero é um widget que permite animar widgets entre telas
            // o Hero precisa de uma tag para identificar o widget que vai ser animado
            // o Hero precisa de um child para ser animado

            child: Hero(
              tag: "fade",
              child: zoomOut.value <= 60
                ? Container(
                    margin: const EdgeInsets.only(top: 590),
                    // a largura do container é controlada pela animação squeezeBottom
                    width: squeezeBottom.value,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    // o texto do botão é controlado pela animação squeezeBottom
                    // se o valor da animação for maior que 75, o texto é exibido
                    // se o valor da animação for menor que 75, o progress indicator é exibido
                    child: squeezeBottom.value > 75
                        ? const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.5,
                            ),
                          )
                        : const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                          ),
                  )
                // se o valor da animação zoomOut for maior que 60, o container é exibido
                // fazendo uma animação de zoom out
                : Container(
                    width: zoomOut.value,
                    height: zoomOut.value,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 227, 51),
                      // se o valor da animação for menor que 500, o container é exibido como um circulo
                      // se o valor da animação for maior que 500, o container é exibido como um retangulo
                      shape: zoomOut.value < 500 ? BoxShape.circle : BoxShape.rectangle,
                    ),
                  ),
            )
          ),
        );
      },
    );
  }
}
