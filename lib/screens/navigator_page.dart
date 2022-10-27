import 'package:flutter/material.dart';
import 'home_page.dart';
import 'crono_page.dart';
import 'profile_page.dart';

class MyBottomNavigatorPage extends StatefulWidget {
  const MyBottomNavigatorPage({super.key});

  @override
  State<MyBottomNavigatorPage> createState() => _MyBottomNavigatorPageState();
}

class _MyBottomNavigatorPageState extends State<MyBottomNavigatorPage> {
  // To Manage BottomNavigatorBar
  static final List<Widget> _myPages = <Widget>[
    const HomePage(title: "Fitness time"),
    const CronoPage(),
    const ProfilePage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ),
      );
      setState(() {});
    }
  }

// To Manage BottomNavigatorBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Crono",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
