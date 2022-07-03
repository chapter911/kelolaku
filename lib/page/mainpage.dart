import 'package:flutter/material.dart';
import 'package:kelolaku/page/dashboardpage.dart';
import 'package:kelolaku/page/fiturlainpage.dart';
import 'package:kelolaku/page/kasirpage.dart';
import 'package:kelolaku/page/transaksipage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    TransaksiPage(),
    KasirPage(),
    FiturLainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined),
              label: 'Transaksi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopify),
              label: 'Kasir',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Fitur Lain',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
