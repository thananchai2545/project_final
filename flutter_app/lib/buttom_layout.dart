import 'package:flutter/material.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/list_page.dart';
import 'package:flutter_app/profile.dart';
import 'package:go_router/go_router.dart';

class ButtomLayout extends StatefulWidget {
  const ButtomLayout({super.key});

  @override
  _ButtomLayoutState createState() => _ButtomLayoutState();
}

class _ButtomLayoutState extends State<ButtomLayout> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = [HomePage(), Profile()];

  Future<void> _onItemTapped(int index) async {
    final isValid = await AuthService().validateNavigationToProtectedRoute();
    // final loggingIn = state.matchedLocation == '/login' ||
    //     state.matchedLocation == '/register';
    if (isValid) {
      setState(() {
        _selectedIndex = index;
      });
    } else if (!isValid) {
      await AuthService().clearToken();
      context.push('/login');
    }
    return;
  }

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
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ผู้ใช้งาน',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}
