import 'package:flutter/material.dart';
import 'myhomepage.dart';

class itemDetail extends StatefulWidget {
  const itemDetail(
      {Key? key,
      required this.title,
      required this.image,
      required this.recipe})
      : super(key: key);

  final String title;
  final String image;
  final String recipe;

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
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Receita",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.recipe,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.orangeAccent,
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }
}

String loremIpsum = '''
    2 xícaras de chá de farinho de trigo
    1 ovo (grande)
    2 colheres de sopa de açúcar
    1 colher pequena de fermento em pó
    1/2 copo de leite
    Canela em pó
    
    1.Coloque em um recipiente o açúcar, o ovo inteiro, o trigo e 
    o leite.

    2.Bata até obter uma massa homogênea.

    3.Frite e polvilhe com açúcar e canela.
    
    
    ''';
