import 'package:flutter/material.dart';
import 'myhomepage.dart';

class itemDetail extends StatefulWidget {
  const itemDetail({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _itemDetailState createState() => _itemDetailState();
}

class _itemDetailState extends State<itemDetail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: [CustomSwitch()],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/comida.jpg',
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    loremIpsum,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

String loremIpsum =
    '''
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
