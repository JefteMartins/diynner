import 'dart:convert';
import 'package:diynner_alt/app_controller.dart';
import 'package:diynner_alt/infoDataModel.dart';
import 'package:diynner_alt/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

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
                  currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/logo.png')),
                  accountName: Text('Teste de Teste'),
                  accountEmail: Text('Teste@teste.com')),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Deslogar'),
                subtitle: Text('Sair da sua conta'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              CustomSwitch(),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(widget.title),
          actions: [CustomSwitch()],
        ),
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<InfoDataModel>;
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.fastfood),
                      title: Text('${items[index].name}'),
                      onTap: () {
                        debugPrint('${items[index]} foi selecionado');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                itemDetail(title: '${items[index].name}')));
                      },
                      minVerticalPadding: 20,
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            } // This trailing comma makes auto-formatting nicer for build methods.
          },
        ));
  }

  Future<List<InfoDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/json/info.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => InfoDataModel.fromJson(e)).toList();
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
