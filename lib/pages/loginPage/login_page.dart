import 'package:flutter/material.dart';
import 'package:login_app/pages/loginPage/components/login_sigin_bottom.dart';
import 'package:login_app/pages/loginPage/components/login_text_bottom.dart';

import '../homePage/home_page.dart';
import 'components/login_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// singleTickerProviderStateMixin e um mixin que permite que o estado da pagina seja atualizado a cada frame
class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    //é necessario inicializar o animationController
    animationController = AnimationController(
      // vsync: this, e um parametro que permite que o estado da pagina seja atualizado a cada frame
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Quando o animationController terminar de executar a animacao, ele ira chamar a funcao
    // mudando a pagina para a HomePage
    animationController!.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

// e necessario desalocar o animationController
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(image: DecorationImage(image: AssetImage('assets/fundo.jpg'), fit: BoxFit.cover)),
        child: ListView(padding: EdgeInsets.zero, children: [
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Image(image: AssetImage('assets/logo.png')),
                  LoginFormField(title: 'Username', icon: Icons.person_outline, obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginFormField(title: 'Password', icon: Icons.lock_outlined, obscureText: true),
                  Padding(
                      padding: const EdgeInsets.only(right: 240),
                      child: LoginTextBottom(text: 'Forgot password?', onPressed: () {})),
                  const SizedBox(
                    height: 90,
                  ),
                  LoginTextBottom(text: 'Don\'t have an account? Register', onPressed: () {}),
                ],
              ),
              AnimateddBottom(animationController: animationController!)
            ],
          )
        ]),
      ),
    );
  }
}
