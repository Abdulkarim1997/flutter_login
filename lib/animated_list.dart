import 'package:flutter/material.dart';
import 'package:flutter_login/color/color.dart';
import 'package:flutter_login/components/components.dart';

class AnimatedListScreen extends StatefulWidget {
  const AnimatedListScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedListScreen> createState() => _AnimatedListScreenState();
}

class _AnimatedListScreenState extends State<AnimatedListScreen> {
  int x = 0;
  List<String> items = ["item1", "item2", "item3"];
  final key = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text("Animated List "),
        centerTitle: true,
      ),
      body: Column(
        children: [
          defaultButton(
              function: () {
                // setState(() {});
                insertItem(2);
              },
              text: "+",
              width: width * .2,
              height: height * .04),
          Expanded(
              child: AnimatedList(
            key: key,
            initialItemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (context, index, animation) =>
                buildCardAnimation(width, height, index, animation),
          )),
        ],
      ),
    );
  }

  Widget buildCardAnimation(
      double width, double height, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        height: height / 10,
        width: width * .9,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: greenColor,
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ]),
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .02),
          child: Row(
            children: [
              Text(items[index]),
              Spacer(),
              IconButton(
                onPressed: () => removeItem(width, height, index),
                icon: const Icon(Icons.delete_forever_rounded),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget buildCardDeleteAnimation(double width, double height, int index) {
    return Container(
      height: height / 10,
      width: width * .9,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: redColor,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      child: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .02),
        child: Row(
          children: [
            Text("Deleted"),
          ],
        ),
      )),
    );
  }

  void removeItem(double width, double height, int index) {
    final item = items.removeAt(index);
    key.currentState?.removeItem(
        index,
        (context, animation) =>
            buildCardAnimation(width, height, index, animation));
  }

  void insertItem(int index) {
    x++;
    items.insert(index, "itemN $x");
    key.currentState?.insertItem(index);
  }
}
