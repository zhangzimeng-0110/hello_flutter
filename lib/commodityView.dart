import 'package:flutter/material.dart';
import 'boxProductsView.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'box_modem.dart';

class commodityView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return commodityList();
  }
}

//商品 commodityList
class commodityList extends StatefulWidget {

  @override
  State<commodityList> createState() => _commodityListState();
}

class _commodityListState extends State<commodityList> {

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'title': '商品1',
      'image': 'assets/product1.PNG',
    },
    {
      'id': 2,
      'title': '商品2',
      'image': 'assets/product2.PNG',
    },
    {
      'id': 3,
      'title': '商品3',
      'image': 'assets/product3.PNG',
    },
    {
      'id': 4,
      'title': '商品4',
      'image': 'assets/product4.PNG',
    },
    {
      'id': 5,
      'title': '商品5',
      'image': 'assets/product5.PNG',
    },
    {
      'id': 6,
      'title': '商品6',
      'image': 'assets/product6.PNG',
    },
    {
      'id': 7,
      'title': '商品7',
      'image': 'assets/product7.PNG',
    },
    {
      'id': 8,
      'title': '商品8',
      'image': 'assets/product8.PNG',
    },
    {
      'id': 9,
      'title': '商品1',
      'image': 'assets/product1.PNG',
    },
    {
      'id': 10,
      'title': '商品2',
      'image': 'assets/product2.PNG',
    },
    {
      'id': 11,
      'title': '商品3',
      'image': 'assets/product3.PNG',
    },
    {
      'id': 12,
      'title': '商品4',
      'image': 'assets/product4.PNG',
    },
    {
      'id': 13,
      'title': '商品5',
      'image': 'assets/product5.PNG',
    },
    {
      'id': 14,
      'title': '商品6',
      'image': 'assets/product6.PNG',
    },
    {
      'id': 15,
      'title': '商品7',
      'image': 'assets/product7.PNG',
    },
    {
      'id': 16,
      'title': '商品8',
      'image': 'assets/product8.PNG',
    },
    // ... 更多商品
  ];
  void _navigateToDetail(int data) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => boxProductsView(index: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //解决无线高度问题
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 两列
          crossAxisSpacing: 10, // 列间距
          mainAxisSpacing: 10, // 行间距
          childAspectRatio: 3 / 2, // 宽高比
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                // 商品点击事件
                print("Index===$index");
                _navigateToDetail(index);
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      products[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(4.0),
                    color: Colors.black45,
                    child: Text(
                      products[index]['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}


//heading typeView
class typeView extends StatefulWidget {
  const typeView({super.key});

  @override
  State<typeView> createState() => _typeViewState();
}

class _typeViewState extends State<typeView> {
  int _selectedIndex=0;

  void _onItemTapped(int index) {
    setState(() {

      _selectedIndex = index;
      print("$index");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        for (int i = 0; i < 10; i++)
          GestureDetector(
            onTap: () => _onItemTapped(i),
            child: Container(
              width: 50,
              height: 100,
              margin: EdgeInsets.all(8),
              color: _selectedIndex == i ? Colors.deepOrangeAccent : Colors.grey,
              child: Center(
                child: Text(
                  '按钮 $i',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

Future<List<BoxList>> fetchProducts() async {
  final response = await http.get(Uri.parse('http://rap2api.taobao.org/app/mock/321298/flutter_demo/boxlist'));
  String rsr=response.body;

  if (response.statusCode == 200) {
    print("$rsr");
    final Map<String, dynamic> productsJson = json.decode(response.body);
    Box_products box = Box_products.fromJson(productsJson);
    //List<Box_products> box = (productsJson['boxList'] as List).map((x) => Box_products.fromJson(x)).toList();
    return box.boxList;
  } else {
    throw Exception('Failed to load products');
  }
}

class boxProductsAllView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchProducts(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('zzm Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Container(
                  height: 40,
                  child: typeView(),
                ),
                Container(
                  child: commodityView(),
                ),
              ],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        }
    );
  }
}


