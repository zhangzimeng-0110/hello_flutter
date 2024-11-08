import 'package:flutter/material.dart';

class boxProductsView extends StatelessWidget {
  int index;
  boxProductsView({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("dddd===$index"),
      ),
      body: Center(
        child: Text("dddd"),
      ),
    );
  }
}
