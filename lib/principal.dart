import 'package:app_anotacoes/routes.dart';
import 'package:flutter/material.dart';

import 'list_anotacoes.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotesApp',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: AnotacaoList(),
        onWillPop: () async {
          final result = await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Sair?'),
                    content: const Text('Deseja sair?'),
                    actions: [
                      TextButton(
                          child: const Text('Não'),
                          onPressed: () => Navigator.pop(context, false)),
                      TextButton(
                          child: const Text('Sim'),
                          onPressed: () {
                            Navigator.pop(context, true);
                          }),
                    ],
                  ));
          return result;
        });

    //AnotacaoList();
  }
}

class LateralPage extends StatelessWidget {
  final accountName = 'Adson Matheus';
  final accountEmail = 'adson.matheus.016@ufrn.edu.br';

  const LateralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
                child: Image.asset('assets/images/profilePicture.jfif')),
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
          ),
          const ListTileMain(
            icon: Icon(Icons.list_alt),
            text: 'Ver as minhas anotações',
            path: '/list_anotacao',
          ),
          const ListTileMain(
              icon: Icon(Icons.add),
              text: 'Adicionar nova anotação',
              path: '/add_anotacao'),
        ],
      ),
    );
  }
}

class ListTileMain extends StatelessWidget {
  final Widget icon;
  final String? text;
  final String? path;
  const ListTileMain({Key? key, required this.icon, this.text, this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text('$text'),
      onTap: () => Navigator.of(context).pushNamed('$path'),
    );
  }
}
