import 'package:flutter/material.dart';
import 'package:login_app/pages/homePage/components/category_view.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({super.key, required this.containerGrow});

  final Animation<double> containerGrow;

  @override
  Widget build(BuildContext context) {
    //pegando as dimensoes da tela
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fundo.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Bem vindo,',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            Container(
                alignment: Alignment.topRight,
                width: containerGrow.value * 120,
                height: containerGrow.value * 120,
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/perfil.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  width: containerGrow.value * 35,
                  height: containerGrow.value * 35,
                  margin: const EdgeInsets.only(left: 80),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(80, 210, 194, 1),
                  ),
                  child: Center(
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontSize: containerGrow.value * 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
            CategoryView()
          ],
        ),
      ),
    );
  }
}
