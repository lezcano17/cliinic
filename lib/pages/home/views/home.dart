import 'package:cliinic/pages/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTapNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Center(child: Text("Cliinic")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 25,
          opacity: 1,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
          size: 30,
          opacity: 1,
        ),
        currentIndex: _selectedIndex,
        onTap: (index) => _onTapNavBar(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.outbox_rounded),
            label: 'Prueba',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
        ],
      ),
    );
  }
}
