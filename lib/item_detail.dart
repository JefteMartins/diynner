import 'package:diynner_alt/app_controller.dart';
import 'package:flutter/material.dart';
import 'myhomepage.dart';
import 'main.dart';
import 'myapp.dart';

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
                Image.asset('assets/images/comida.jpg', fit: BoxFit.fitWidth),
                Text(widget.title),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(loremIpsum),
                ),
              ],
            ),
          )),
    );
  }
}

String loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce maximus, ex vitae fringilla tempus, sapien urna vulputate nisi, sed sagittis urna libero ac metus. Suspendisse quis velit urna. Cras elementum est leo, id sagittis lectus sollicitudin maximus. Integer vitae tempus libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent a orci ut massa ornare eleifend. Etiam pharetra lacus eu nisl porta imperdiet. Integer vel tristique felis, eu convallis massa. Vivamus rhoncus cursus dolor, sit amet porttitor enim scelerisque nec. Curabitur pharetra erat eget purus auctor, quis pulvinar odio consequat. Suspendisse efficitur lectus lacus, in scelerisque arcu pellentesque ac. Donec feugiat ut nibh ut hendrerit. Aenean feugiat, mauris vel mattis luctus, metus diam consequat lorem, at blandit metus ex ut lorem. Nam eu nunc congue, semper leo vitae, varius felis. Aenean justo dolor, facilisis id libero quis, semper convallis risus. Ut porttitor purus quis velit pellentesque commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce maximus, ex vitae fringilla tempus, sapien urna vulputate nisi, sed sagittis urna libero ac metus. Suspendisse quis velit urna. Cras elementum est leo, id sagittis lectus sollicitudin maximus. Integer vitae tempus libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent a orci ut massa ornare eleifend. Etiam pharetra lacus eu nisl porta imperdiet. Integer vel tristique felis, eu convallis massa. Vivamus rhoncus cursus dolor, sit amet porttitor enim scelerisque nec. Curabitur pharetra erat eget purus auctor, quis pulvinar odio consequat. Suspendisse efficitur lectus lacus, in scelerisque arcu pellentesque ac. Donec feugiat ut nibh ut hendrerit. Aenean feugiat, mauris vel mattis luctus, metus diam consequat lorem, at blandit metus ex ut lorem. Nam eu nunc congue, semper leo vitae, varius felis. Aenean justo dolor, facilisis id libero quis, semper convallis risus. Ut porttitor purus quis velit pellentesque commodo.";
