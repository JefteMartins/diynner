import 'dart:convert';

import 'package:diynner_alt/infoDataModel.dart';
import 'package:diynner_alt/item_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as rootBundle;

class itemDetail extends StatefulWidget {
  const itemDetail(
      {Key? key,
      required this.title,
      required this.image,
      required this.recipe})
      : super(key: key);

  final String title;
  final String image;
  final List<Recipe> recipe;

  @override
  _itemDetailState createState() => _itemDetailState();
}

class _itemDetailState extends State<itemDetail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(widget.image),
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 8, left: 20),
                child: Text(
                  "Receita",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 8, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...widget.recipe
                        .map(
                          (e) => Text(
                            "${e.quantity} ${e.measure} de ${e.item} " ?? "",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                            ),
                            softWrap: true,
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                        .toList()
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Itempayment()));
          },
          backgroundColor: Colors.orangeAccent,
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }
}
/* "3 xícaras de arroz \n\n 6 xícaras de água\n\n 1 caixa de uvas-passasn\n\n queijo parmesão ralado\n\n 5 colheres de ervilha\n\n 1 colher de manteiga\n\n óleo\n\n pimentão\n\n cebola\n\n salsa\n\n cebolinha verde\n\n cenoura a gosto\n\n sal a gosto\n\n" */