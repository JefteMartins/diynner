import 'package:flutter/material.dart';

import 'infoDataModel.dart';

class Itempayment extends StatefulWidget {
  const Itempayment(
      {Key? key,
      required this.title,
      required this.image,
      required this.recipe})
      : super(key: key);

  final String title;
  final String image;
  final List<Recipe> recipe;

  @override
  _ItempaymentState createState() => _ItempaymentState();
}

class _ItempaymentState extends State<Itempayment> {
  get sum => null;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text("Pagamento")),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image(
                            image: NetworkImage(widget.image.toString()),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          widget.title.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "R\$ ${returnPrice()}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  returnPrice() {
    int sum = 0;
    for (var i = 0; i < widget.recipe.length; i++) {
      int temp = widget.recipe[i].value as int;
      sum = sum + temp;
    }
    return sum;
  }
}
