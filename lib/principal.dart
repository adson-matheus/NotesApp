import 'package:flutter/material.dart';

import 'nova_anotacao.dart';
import 'ver_anotacoes.dart';

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
              TextButton(
                child: const Text(
                  'Ver as minhas anotações',
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  elevation: 10,
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.all(20.0),
                ),
                onPressed: () => Navigator.pushNamed(context, '/list_anotacao'),
              ),
              Container(height: 30),
              TextButton(
                child: const Text(
                  'Adicionar nova anotação',
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  elevation: 10,
                  textStyle: const TextStyle(fontSize: 20),
                  padding: const EdgeInsets.all(20.0),
                ),
                onPressed: () => Navigator.pushNamed(context, '/add_anotacao'),
              ),
            ],
          ),
        ),
      );
}
