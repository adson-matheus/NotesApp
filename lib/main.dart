import 'package:flutter/material.dart';

import 'ver_anotacoes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Over Screens',
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
//      home: MainPage(),

      // Declare routes
      routes: {
        // Main initial route
        '/': (context) => const MainPage(),
        // Second route
        '/anotacoes': (context) => const Anotacoes(),
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
                onPressed: () => Navigator.pushNamed(context, '/anotacoes'),
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
                onPressed: () => Navigator.pushNamed(context, '/anotacoes'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
