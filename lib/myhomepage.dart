import 'dart:convert';
import 'package:diynner_alt/app_controller.dart';
import 'package:diynner_alt/infoDataModel.dart';
import 'package:diynner_alt/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

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
                    return GestureDetector(
                      onTap: () => {
                        debugPrint(
                            'Item $index, ${items[index].name} foi selecionado'),
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => itemDetail(
                                  title: '${items[index].name}',
                                  image: items[index].image.toString(),
                                  recipe: items[index].recipe!,
                                  steps: items[index].preparation!,
                                ))),
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Card(
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: Image(
                                      image: NetworkImage(
                                          items[index].image.toString()),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Text(
                                          items[index].name.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
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
