import 'package:diynner_alt/infoDataModel.dart';
import 'package:diynner_alt/item_payment.dart';
import 'package:flutter/material.dart';

class itemDetail extends StatefulWidget {
  const itemDetail(
      {Key? key,
      required this.title,
      required this.image,
      required this.recipe,
      required this.steps})
      : super(key: key);

  final String title;
  final String image;
  final List<Recipe> recipe;
  final List<Preparation> steps;

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
                    top: 8, bottom: 8, right: 8, left: 20),
                child: Text(
                  "Elemento principal: ${widget.recipe[0].item}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                    ...buildRecipe(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 8, left: 20),
                child: Text(
                  "Modo de preparo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                    ...buildSteps(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 50, right: 8, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Itempayment(
                      title: widget.title,
                      image: widget.image,
                      recipe: widget.recipe,
                    )));
          },
          backgroundColor: Colors.orangeAccent,
          child: const Icon(Icons.shopping_cart_outlined),
        ),
      ),
    );
  }

  buildRecipe() {
    return widget.recipe
        .map(
          (e) => Text(
            " • ${e.quantity} ${e.measure} de ${e.item} ",
            style: TextStyle(
              fontFamily: 'HindMadurai',
              fontSize: 18,
            ),
          ),
        )
        .where((element) => true)
        .toList();
  }

  buildSteps() {
    return widget.steps
        .map(
          (e) => Text(
            "${e.step} - ${e.description} ",
            style: TextStyle(
              fontFamily: 'HindMadurai',
              fontSize: 18,
            ),
          ),
        )
        .where((element) => true)
        .toList();
  }
}
