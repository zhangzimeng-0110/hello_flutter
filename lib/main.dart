import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/services.dart';
import 'demo_pageview.dart';
void main() {

  runApp(
      Mywidget(),
  );
}

class Mywidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: homewidget(),
    );
  }
}
class homewidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }

}
class _MyHomePageState extends State<homewidget> {
  int _selectedIndex = 0; // 用于跟踪当前选中的索引

  final List<Widget> _pages = [
    homeviewwidget(),
    //Text('Home Page'),
    //demopageview(),
    Text('Home Page'),
    Text('bag Page'),
    Text('me Page'),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
            /*appBar: AppBar(
                title:Text("一番赏"),
                backgroundColor: Colors.blue,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(
                    'assets/1.png',
                    width: 20,
                    height: 20,
                  ),
                )
            ) ,*/
            body: Center(
              child: _pages.elementAt(_selectedIndex),
            ),
            bottomNavigationBar:BottomNavigationBar(
              //backgroundColor: Colors.red,
              items: [
                BottomNavigationBarItem(
                  icon: const Image(
                    height: 20,
                    width: 20,
                    image: AssetImage('assets/home_icon.jpg'),
                  ),
                  activeIcon: Image.asset('assets/home_activeIcon.jpg'),
                  label: ''
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/store_icon.jpg'),
                  activeIcon:  Image.asset('assets/store.jpg'),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/bag_Icon.jpg'),
                  activeIcon: Image.asset('assets/bag_activeIcon.jpg'),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/me_icon.jpg'),
                  activeIcon:  Image.asset('assets/me_activeIcon.jpg'),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,

            )
        );
  }
}