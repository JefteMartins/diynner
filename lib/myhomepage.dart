import 'package:diynner_alt/app_controller.dart';
import 'package:diynner_alt/item_detail.dart';
import 'package:flutter/material.dart';

import 'main.dart';

import 'myapp.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: Image.asset('assets/images/logo.png'),
                accountName: Text('Teste de Teste'),
                accountEmail: Text('Teste@teste.com')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Incício'),
              subtitle: Text('Tela inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [CustomSwitch()],
      ),
      body:
          buildListView(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.chengeTheme();
      },
    );
  }
}

class Item {
  final String title;
  final String description;

  const Item(this.title, this.description);
}

buildListView() {
  final itens = List<String>.generate(20, (i) => 'Item $i');

  return ListView.builder(
    itemCount: itens.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('${itens[index]}'),
        onTap: () {
          debugPrint('${itens[index]} foi selecionado');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => itemDetail(title: '${itens[index]}')));
        },
        minVerticalPadding: 20,
      );
    },
  );
}
