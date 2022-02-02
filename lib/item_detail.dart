import 'package:diynner_alt/item_payment.dart';
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
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 8, left: 20),
                child: Text(
                  "Pagamento",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 8, left: 15),
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
