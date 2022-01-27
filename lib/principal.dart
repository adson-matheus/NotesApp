import 'package:flutter/material.dart';

import 'nova_anotacao.dart';
import 'ver_anotacoes.dart';
import 'tipo_anotacao.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Over Screens',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),

      // Declare routes
      routes: {
        // Main initial route
        '/': (context) => const MainPage(),
        // Second route
        '/list_anotacao': (context) => const Anotacao(),
        '/add_anotacao': (context) => const AddAnotacao(),
        '/tipo_anotacao': (context) => const TipoAnotacao(),
      },
      initialRoute: '/',
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Início - Note App',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const MainButtons(
                  buttonText: 'Ver as minhas anotações', path: 'list_anotacao'),
              Container(height: 30),
              const MainButtons(
                  buttonText: 'Adicionar nova anotação', path: 'tipo_anotacao'),
            ],
          ),
        ),
      );
}

class MainButtons extends StatelessWidget {
  final String? buttonText;
  final String? path;

  const MainButtons({Key? key, this.buttonText, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        '$buttonText',
      ),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.teal,
        elevation: 10,
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.all(20.0),
      ),
      onPressed: () => Navigator.pushNamed(context, '/$path'),
    );
  }
}
