import 'package:ambulance/constant/token_maneger.dart';
import 'package:ambulance/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  Future<void> _onItemTapped(int index) async {
    final isValid = await AuthService().validateNavigationToProtectedRoute();
    // final loggingIn = state.matchedLocation == '/login' ||
    //     state.matchedLocation == '/register';
    if (isValid) {
      setState(() {
        _selectedIndex = index;
      });
    } else if (!isValid) {
      print('object');
      await AuthService().clearToken();
      context.push('/login');
    }
    // return;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'เคสที่เสร็จสิ้น',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
