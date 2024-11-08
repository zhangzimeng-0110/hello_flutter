import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class slideshowView extends StatefulWidget {
  @override
  slideshowViewState createState() => slideshowViewState();
}

class slideshowViewState extends State<slideshowView> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  List<String> list = [
    'assets/page_1.png',
    'assets/page_2.png',
    'assets/page_3.png',
    'assets/page_4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            height: 260,
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            return GestureDetector(
              onTap: () {
                print("点我了$_current");
              },
              child: Image.asset(list[index],fit: BoxFit.cover),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}