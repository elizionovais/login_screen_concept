import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
   CategoryView({super.key});

  

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  final List<String> categories = [
    'Estudar',
    'Trabalhar',
    'Lazer',
    'Casa',
    'Esporte',
    'Compras',
    'Outros',
  ];
  int _category = 0;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: _category > 0 ? () {
          selelctback();
        } : null,
         icon: const Icon(Icons.arrow_back_ios)),
         Text(categories[_category],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        IconButton(onPressed: _category < categories.length - 1 ? (){
          selectforward();
        } : null,
         icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }

  void selectforward() {
    setState(() {
      _category = _category + 1;
    });
  }
  void selelctback() {
    setState(() {
      _category = _category - 1;
    });
  }
}