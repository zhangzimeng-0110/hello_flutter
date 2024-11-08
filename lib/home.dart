import 'package:flutter/material.dart';
import 'home_pageview.dart';
import 'task_raw.dart';
import 'commodityView.dart';

class homeviewwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                height: 260,
                color: Colors.red,
                child: slideshowView(),
              ),
              Container(
                height: 40,
                color: Colors.yellowAccent,
                child: task_raw_button(),
              ),
              Container(
                child: boxProductsAllView(),
                color: Colors.blue,
              ),
            ],
          ),
        )

    );
  }
}

